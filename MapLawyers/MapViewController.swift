//
//  MapViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import UIKit
import Kingfisher
import MapKit
import AlamofireImage
import Alamofire
class LocationSearchTable : UITableViewController {
    var filteredlawyers: [[String]]=[]
    var mapView: MKMapView? = nil
    
}
extension LocationSearchTable {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredlawyers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let selectedItem = filteredlawyers[indexPath.row]
        cell.textLabel?.text = selectedItem[1]
        cell.detailTextLabel?.text = ""
        return cell
    }
}
extension LocationSearchTable : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        guard let mapView = mapView,
              let searchBarText = searchController.searchBar.text else { return }
        filteredlawyers = lawyersGlobal.filter { $0[1].components(separatedBy: " ").dropLast().joined(separator: " ").contains(searchBarText) }
        print(filteredlawyers)
        
        self.tableView.reloadData()
    }
}


class MapViewController: UIViewController, MKMapViewDelegate {
    
    
    var resultSearchController:UISearchController? = nil
    
    
    
    
    
    
    
    
    
    var mapLawyers: [MapLawyer] = []
    let mapView = MKMapView()
    var lawyers:[[String]] = []
    var lawyersForTableView:[[String]] = []
    let initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        lawyers = lawyersGlobal
        
        
        let locationSearchTable = LocationSearchTable()
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        locationSearchTable.mapView = mapView
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        setupMapViewController()
        let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
        if lawyersGlobal.count > 10
        {
            queueConc.async {
                self.loadInitialData()
            }
        }
        
        
        
    }
    
    
    
}
extension MapViewController{
    
    func setupMapViewController(){
        view.addSubview(mapView)
        mapView.centerToLocation(initialLocation)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(60)
        }
    }
    func loadInitialData() {
        
        for i in 1...lawyers.count-1{
            let gps: [String] = lawyers[i][20].components(separatedBy: ",")
            if gps[0] != "" {
                let geoLawyer = MapLawyer(
                    title: lawyers[i][5],
                    locationName: String(i),
                    discipline: lawyers[i][1],
                    coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!), image: lawyers[i][19])
                mapLawyers.append(geoLawyer)
                mapView.addAnnotation(geoLawyer)
            }
        }
    }
    
    func catchNotification(notification:Notification) -> Void {
        guard let name = notification.userInfo!["name"] else { return }
        lawyers = name as! [[String]]
        let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
        queueConc.async {
            self.loadInitialData()
            //            self.mapLawyer.addAnnotations(self.mapLawyers)
        }
    }
}
extension MapViewController {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let item = annotation as? MapLawyer {
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
            annotationView.annotation = item
            annotationView.image = UIImage(named: "annotation")
            annotationView.canShowCallout = true
            annotationView.subtitleVisibility = .hidden
            annotationView.clusteringIdentifier = "mapItemClustered"
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView.animatesWhenAdded = true
            return annotationView
        } else if let cluster = annotation as? MKClusterAnnotation {
            // 4
            let clusterView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker2")
            if cluster.memberAnnotations.count < 100{
                clusterView.canShowCallout = true}
            clusterView.annotation = cluster
            clusterView.rightCalloutAccessoryView = UIButton(type: .infoDark)
            clusterView.animatesWhenAdded = true
            clusterView.calloutOffset = CGPoint(x: -5, y: 5)
            return clusterView
        } else {
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView {
            if view.annotation is MKClusterAnnotation {
                //*** Need array list of annotation inside cluster here ***
                let detailVC = LawyerViewController()
                detailVC.lawyers = lawyersForTableView
                detailVC.modalPresentationStyle = .formSheet
                navigationController?.pushViewController(detailVC, animated: true)
            }
            
            else {
                let detailVC = LawyerViewController()
                detailVC.lawyers = lawyersForTableView
                //        detailVC.modalPresentationStyle = .popover
                navigationController?.pushViewController(detailVC, animated: true)
                
            }
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        lawyersForTableView.removeAll()
        print(mapView.camera.centerCoordinateDistance )
        if let cluster = view.annotation as? MKClusterAnnotation {
            if mapView.camera.centerCoordinateDistance > 3000{
                
                let currentSpan = mapView.region.span
                let zoomSpan = MKCoordinateSpan(latitudeDelta: currentSpan.latitudeDelta / 2.0, longitudeDelta: currentSpan.longitudeDelta / 2.0)
                let zoomCoordinate = view.annotation?.coordinate ?? mapView.region.center
                let zoomed = MKCoordinateRegion(center: zoomCoordinate, span: zoomSpan)
                mapView.setRegion(zoomed, animated: true)
            }
            let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
            queueConc.async {
                for i in 0...cluster.memberAnnotations.count-1
                {
                    let j = Int(cluster.memberAnnotations[i].subtitle!!)!
                    self.lawyersForTableView.append(self.lawyers[j])
                }
            }
        }
        else {
            if let annotation = view.annotation as? MapLawyer{
                let currentSpan = mapView.region.span
                let zoomSpan = MKCoordinateSpan(latitudeDelta: currentSpan.latitudeDelta / 2.0, longitudeDelta: currentSpan.longitudeDelta / 2.0)
                let zoomCoordinate = view.annotation?.coordinate ?? mapView.region.center
                let zoomed = MKCoordinateRegion(center: zoomCoordinate, span: zoomSpan)
                mapView.setRegion(zoomed, animated: true)
                let index = (self.mapView.annotations as NSArray).index(of: annotation)
                self.lawyersForTableView.append(self.lawyers[index])
            }
        }
        
    }
}



private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 10000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}


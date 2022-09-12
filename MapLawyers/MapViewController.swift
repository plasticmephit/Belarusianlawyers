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
    var handleMapSearchDelegate:HandleMapSearch? = nil
    
}
extension LocationSearchTable {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredlawyers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let selectedItem = filteredlawyers[indexPath.row]
        //        cell.backgroundColor = .clear
        cell.textLabel?.text = selectedItem[1]
        cell.detailTextLabel?.text = selectedItem[5]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = filteredlawyers[indexPath.row]
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        handleMapSearchDelegate?.placeMarkFunc(placeMark: selectedItem)
        dismiss(animated: true, completion: nil)
    }
}
protocol HandleMapSearch {
    
    func placeMarkFunc(placeMark:[String])
    func dropPinZoomIn(placemark:[String])
}
extension LocationSearchTable : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview().inset(10)
        }
        guard let searchBarText = searchController.searchBar.text else { return }
        filteredlawyers = lawyersGlobal.filter { $0[1].components(separatedBy: " ").dropLast().joined(separator: " ").contains(searchBarText) }
        //        print(filteredlawyers)
        self.tableView.reloadData()
    }
}

class MapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {
    
    
    var resultSearchController:UISearchController? = nil
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //        print(lawyers.count)
        
        mapView.addAnnotations(mapLawyers)
       
    }
    var placemark:[String] = [""]
    let potokzagr = OperationQueue()
    var selectedPin:MKPlacemark? = nil
    var mapLawyers: [MapLawyer] = []
    let mapView = MKMapView()
    var lawyers:[[String]] = []
    
    var lawyersForTableView:[[String]] = []
    let initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
     
        potokzagr.maxConcurrentOperationCount = 1
        let locationSearchTable = LocationSearchTable()
        locationSearchTable.mapView?.backgroundColor = .clear
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        let searchBar = resultSearchController!.searchBar
        searchBar.backgroundColor = .clear
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        navigationItem.titleView?.backgroundColor = .clear
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        
        setupMapViewController()
        if lawyersGlobal.count > 2{
            //            let queue = DispatchQueue.global(qos: .utility)
            //            queue.async
            //                { [self] in
            //                lawyers = lawyersGlobal
            //                loadInitialData()
            //            }
        }
        
        
        
    }

   

    
    override func viewWillAppear(_ animated: Bool) {
        mapView.removeAnnotations(mapView.annotations)
        
        potokzagr.addOperation
        { [self] in
            lawyers.removeAll()
            
            mapLawyers.removeAll()
            lawyers = lawyersGlobal
            if lawyers.count > 0{
            lawyers.remove(at: 0)
            if let name = defaults.string(forKey: "filterMesto")
            {
                lawyers = lawyers.filter { $0[5].contains(name) }
            }
            if let name = defaults.string(forKey: "filterCollegia")
            {
                lawyers = lawyers.filter { $0[4].contains(name) }
            }
            if let name = defaults.string(forKey: "filterOnline")
            {
                lawyers = lawyers.filter { $0[29].contains(name) }
            }
            if let name = defaults.string(forKey: "filterMediator")
            {
                lawyers = lawyers.filter { $0[24].contains(name) }
            }
            if let name = defaults.string(forKey: "filterotrasli")
            {
                lawyers = lawyers.filter { $0[18].contains(name) }
            }
            
            loadInitialData()
        }
        }
    }
    
    
    
}
extension MapViewController: HandleMapSearch {
    func placeMarkFunc(placeMark: [String]) {
        placemark.removeAll()
        placemark = placeMark
    }
    
    
    
    func dropPinZoomIn(placemark: [String]) {
        // cache the pin
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        _ = MKPointAnnotation()
        let gps: [String] = placemark[20].components(separatedBy: ",")
        if gps[0] != "" {
            let geoLawyer = MapLawyer(
                title: placemark[5],
                locationName: placemark[0],
                discipline: placemark[1],
                coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!), image: placemark[19])
            mapView.addAnnotation(geoLawyer)
            let location = CLLocation(latitude: Double(gps[0])!, longitude: Double(gps[1])!)
            let regionRadius: CLLocationDistance = 3000
            let coordinateRegion = MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: regionRadius,
                longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        else {
            
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
            make.bottom.equalToSuperview().inset(0)
        }
    }
    func loadInitialData() {
        if lawyers != [] {
            for i in 0...lawyers.count-1{
                let gps: [String] = lawyers[i][20].components(separatedBy: ",")
                if gps[0] != ""{
                    let geoLawyer = MapLawyer(
                        title: lawyers[i][5],
                        locationName: lawyers[i][0],
                        discipline: lawyers[i][1],
                        coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!), image: lawyers[i][19])
                    mapLawyers.append(geoLawyer)
                    mapView.addAnnotation(geoLawyer)
                }
//                mapView.addAnnotations(mapLawyers)
            }
        }
    }
    
    func catchNotification(notification:Notification) -> Void {
        //        DispatchQueue.main.async { [self] in
        //        mapView.removeAnnotations(mapView.annotations)
        //        }
        //        lawyers.removeAll()
        //
        //        mapLawyers.removeAll()
        //        guard let name = notification.userInfo!["name"] else { return }
        //        let queue = DispatchQueue.global(qos: .utility)
        //        queue.async {
        //            self.lawyers = name as! [[String]]
        //
        //            self.loadInitialData()
        //            //            self.mapLawyer.addAnnotations(self.mapLawyers)
        //        }
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
                let detailVC = MenuTableViewController()
                lawyersForTableView.sort { ($0[29]) < ($1[29]) }
                detailVC.lawyers = lawyersForTableView
                detailVC.lawyersFilterSave = lawyersForTableView
                detailVC.modalPresentationStyle = .formSheet
                navigationController?.pushViewController(detailVC, animated: true)
            }
            
            else {
                let detailVC = LawyerDetailsViewController()
                detailVC.lawyersDetails = lawyersForTableView[0]
               
                navigationController?.pushViewController(detailVC, animated: true)
                
            }
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        lawyersForTableView.removeAll()
        //        print(mapView.camera.centerCoordinateDistance )
        if let cluster = view.annotation as? MKClusterAnnotation {
            if mapView.camera.centerCoordinateDistance > 3000{
                
                let currentSpan = mapView.region.span
                let zoomSpan = MKCoordinateSpan(latitudeDelta: currentSpan.latitudeDelta / 2.0, longitudeDelta: currentSpan.longitudeDelta / 2.0)
                let zoomCoordinate = view.annotation?.coordinate ?? mapView.region.center
                let zoomed = MKCoordinateRegion(center: zoomCoordinate, span: zoomSpan)
                mapView.setRegion(zoomed, animated: true)
            }
            let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
            queueConc.async { [self] in
                for i in 0...cluster.memberAnnotations.count-1
                {
                    let j = Int(cluster.memberAnnotations[i].subtitle!!)!
                    self.lawyersForTableView.append(lawyersGlobal[j])
                    //                    print(j)
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
                let index = Int(annotation.subtitle!)!
                print(index)
                if placemark[0] != ""
                {
                    self.lawyersForTableView.append(self.placemark)
                    placemark[0] = ""
                }
                else{
                    self.lawyersForTableView.append(lawyersGlobal[index])
                }
                
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


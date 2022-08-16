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

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapLawyers: [MapLawyer] = []
    let mapView = MKMapView()
    var lawyers:[[String]] = []
    let initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        lawyers = lawyersGlobal
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        setupMapViewController()
        let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
        if lawyersGlobal.count != 0
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
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(60)
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
        // 1
        
        if let item = annotation as? MapLawyer {
            // 2
            
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
            
            annotationView.annotation = item
            annotationView.image = UIImage(named: "annotation")
            // 3
            annotationView.canShowCallout = true
            annotationView.subtitleVisibility = .hidden
            annotationView.clusteringIdentifier = "mapItemClustered"
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView.animatesWhenAdded = true
            return annotationView
        } else if let cluster = annotation as? MKClusterAnnotation {
            // 4
            let clusterView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker2")
            clusterView.canShowCallout = true
            clusterView.annotation = cluster
            clusterView.image = UIImage(named: "cluster")
            clusterView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            clusterView.animatesWhenAdded = true
            return clusterView
        } else {
            return nil
        }
    }
    
    //
    //    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
    //        annotationView.markerTintColor = UIColor.blue
    //        annotationView.canShowCallout = true
    ////        annotationView.calloutOffset = CGPoint(x: -5, y: 5)
    ////        let mapsButton = UIButton(frame: CGRect(
    ////            origin: CGPoint.zero,
    ////            size: CGSize(width: 48, height: 48)))
    ////        //        mapsButton.setBackgroundImage(#imageLiteral(resourceName: "Map"), for: .normal)
    ////        annotationView.rightCalloutAccessoryView = mapsButton
    //        annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    //        if #available(iOS 11.0, *) {
    //            annotationView.clusteringIdentifier = "MyMarker"
    //        }
    //        return annotationView
    //    }
    //
    //
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            var lawyersForTableView:[[String]] = []
            if let cluster = view.annotation as? MKClusterAnnotation {
                //*** Need array list of annotation inside cluster here ***
                
                for i in 0...cluster.memberAnnotations.count-1
                {
                    
                    let j = Int(cluster.memberAnnotations[i].subtitle!!)!
                    lawyersForTableView.append(lawyers[j])
                }
                let detailVC = LawyerViewController()
                
                detailVC.lawyers = lawyersForTableView
                //        detailVC.modalPresentationStyle = .popover
                navigationController?.pushViewController(detailVC, animated: true)
            }
            
            else {
                if let annotation = view.annotation as? MapLawyer{
                    let index = (self.mapView.annotations as NSArray).index(of: annotation)
                    let detailVC = LawyerViewController()
                    lawyersForTableView.append(lawyers[index])
                    detailVC.lawyers = lawyersForTableView
                    //        detailVC.modalPresentationStyle = .popover
                    navigationController?.pushViewController(detailVC, animated: true)
                }
            }
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
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


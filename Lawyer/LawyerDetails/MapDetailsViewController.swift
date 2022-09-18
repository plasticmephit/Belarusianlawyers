//
//  MapDetailsViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 30.08.22.
//

import UIKit
import Kingfisher
import MapKit
import AlamofireImage
import Alamofire

class MapDetailsViewController: UIViewController, MKMapViewDelegate {
    
  
   
    var placemark:[String] = []
    
    var selectedPin:MKPlacemark? = nil
    var mapLawyers: [MapLawyer] = []
    let mapView = MKMapView()
    var lawyers:[String] = []
    var lawyersForTableView:[[String]] = []
    var initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
      
        let gps: [String] = lawyers[20].components(separatedBy: ",")
        if gps[0] != ""{
            let geoLawyer = MapLawyer(
                title: lawyers[5],
                locationName: lawyers[0],
                discipline: lawyers[1],
                coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!), image: lawyers[19])
            initialLocation = CLLocation(latitude: Double(gps[0])!, longitude: Double(gps[1])!)
            mapLawyers.append(geoLawyer)
        }
        mapView.addAnnotations(mapLawyers)
        
          setupMapViewController()
    }
    
    
    
}
extension MapDetailsViewController{
    
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
}

extension MapDetailsViewController {
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
                navigationController?.popViewController(animated: true)
            }
            
            else {
                let detailVC = LawyerDetailsViewController()
                detailVC.lawyersDetails = lawyersForTableView[0]
            
                navigationController?.popViewController(animated: true)
                
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
            queueConc.async {
               
//                    let j = Int(cluster.memberAnnotations[i].subtitle!!)!
                    self.lawyersForTableView.append(self.lawyers)
                
            }
        }
        else {
            if view.annotation is MapLawyer{
                let currentSpan = mapView.region.span
                let zoomSpan = MKCoordinateSpan(latitudeDelta: currentSpan.latitudeDelta / 2.0, longitudeDelta: currentSpan.longitudeDelta / 2.0)
                let zoomCoordinate = view.annotation?.coordinate ?? mapView.region.center
                let zoomed = MKCoordinateRegion(center: zoomCoordinate, span: zoomSpan)
                mapView.setRegion(zoomed, animated: true)
//                let index = (self.mapView.annotations as NSArray).index(of: annotation)
               
               
                    self.lawyersForTableView.append(self.lawyers)
                
                
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



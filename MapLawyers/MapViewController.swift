//
//  MapViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import UIKit
import Kingfisher
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate {
    var mapLawyers: [MapLawyer] = []
    let mapLawyer = MKMapView()
    var lawyers:[[String]] = []
    let initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        setupMapViewController()
        mapLawyer.register(
          ArtworkView.self,
          forAnnotationViewWithReuseIdentifier:
            MKMapViewDefaultAnnotationViewReuseIdentifier)

//
        if lawyers.count != 0
        { loadInitialData()}
        
        mapLawyer.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
extension MapViewController{
    func setupMapViewController(){
        view.addSubview(mapLawyer)
        mapLawyer.centerToLocation(initialLocation)
        mapLawyer.translatesAutoresizingMaskIntoConstraints = false
        mapLawyer.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(60)
            make.bottom.equalToSuperview().inset(60)
        }
    }
    
    private func loadInitialData() {
        for i in 1...lawyers.count-1{
            let gps: [String] = lawyers[i][20].components(separatedBy: ",")
            if gps[0] != "" {
                let kostil = UIImageView()
                kostil.kf.setImage(with: URL(string: lawyers[i][19]))
                let geoLawyer = MapLawyer(
                    title: lawyers[i][1],
                    locationName: lawyers[i][1],
                    discipline: lawyers[i][1],
                    coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!),
                    ava: kostil)
                mapLawyers.append(geoLawyer)
                
            }
        }
        
    }
    func catchNotification(notification:Notification) -> Void {
      guard let name = notification.userInfo!["name"] else { return }
        lawyers = name as! [[String]]
        
        DispatchQueue.main.async {
            self.loadInitialData()
            self.mapLawyer.addAnnotations(self.mapLawyers)
                  }
   
        
    }
//    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        let identifier = "MyCustomAnnotation"
//
//
//        let index = (self.mapLawyer.annotations as NSArray).index(of: annotation)
//
//        let kostil = UIImageView()
//                        kostil.kf.setImage(with: URL(string: alawyers[index][19]))
//
//        var annotationView = mapLawyer.dequeueReusableAnnotationView(withIdentifier: identifier)
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView?.canShowCallout = true
//
//            annotationView!.image = kostil.image
//
//        } else {
//            annotationView!.annotation = annotation
//        }
//
//
////        configureDetailView(annotationView: annotationView!)
//
//        return annotationView
//    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation
        let index = (self.mapLawyer.annotations as NSArray).index(of: annotation!)
        print ("Annotation Index = \(index)")

    }
//    func configureDetailView(annotationView: MKAnnotationView) {
//            annotationView.detailCalloutAccessoryView = UIImageView(image: UIImage(named: "url.jpg"))
//    }
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


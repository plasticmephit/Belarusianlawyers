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
    let mapLawyer = MKMapView()
    var lawyers:[[String]] = []
    let initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    var lawyersForTableView:[[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        lawyers = lawyersGlobal
//        mapLawyer.register(
//          ArtworkView.self,
//          forAnnotationViewWithReuseIdentifier:
//            MKMapViewDefaultAnnotationViewReuseIdentifier)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        setupMapViewController()

        if lawyersGlobal.count != 0
        {
            loadInitialData()}
        mapLawyer.delegate = self
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
                let geoLawyer = MapLawyer(
                    title: lawyers[i][5],
                    locationName: lawyers[i][1],
                    discipline: lawyers[i][1],
                    coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!), image: lawyers[i][19] )
                mapLawyers.append(geoLawyer)
                mapLawyer.addAnnotation(geoLawyer)
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
    //
   
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation
        let index = (self.mapLawyer.annotations as NSArray).index(of: annotation!)
        print ("Annotation Index = \(index)")
        let detailVC = LawyerViewController()
        lawyersForTableView.removeAll()
        lawyersForTableView.append(lawyers[index])
        for i in 1...lawyers.count-1{
           
            if lawyers[index][20] == lawyers[i][20]
            {
                lawyersForTableView.append(lawyers[i])
            }
        }
        print(lawyersForTableView.count)
        detailVC.lawyers = lawyersForTableView
        //        detailVC.modalPresentationStyle = .popover
        navigationController?.pushViewController(detailVC, animated: true)
        
        
        
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


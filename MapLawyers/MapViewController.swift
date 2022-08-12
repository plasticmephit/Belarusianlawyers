//
//  MapViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    let mapLawyer = MKMapView()
    let initialLocation = CLLocation(latitude: 53.906374, longitude: 27.485447)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapViewController()
        loadInitialData()
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
            make.top.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(40)
        }
    }
    
    private func loadInitialData() {
        for i in 1...100{
            let gps: [String] = alawyers[i][20].components(separatedBy: ",")
            if gps[0] != "" {
                print(gps[1])
            let geoLawyer = MapLawyer(
                title: alawyers[i][1],
                locationName: alawyers[i][1],
                discipline:alawyers[i][1],
                coordinate: CLLocationCoordinate2D(latitude: Double(gps[0])!, longitude: Double(gps[1])!))
            mapLawyer.addAnnotation(geoLawyer)
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

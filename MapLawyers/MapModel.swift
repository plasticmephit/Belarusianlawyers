//
//  MapModel.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import Foundation
import MapKit
import Kingfisher
import SwiftUI
import SnapKit
class MapLawyer: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    var image: String?
   
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D,
        image: String
       
    )
    {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.image = image
      
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

//
//class ArtworkView: MKAnnotationView {
//  override var annotation: MKAnnotation? {
//    willSet {
//      guard let artwork = newValue as? MapLawyer else {
//        return
//      }
//        let annotationLabel = UILabel()
//
//        annotationLabel.font = UIFont.systemFont(ofSize: 12)
//        annotationLabel.textColor = .black
//        annotationLabel.text = artwork.title?.components(separatedBy: " ").dropLast().joined(separator: " ")
//        addSubview(annotationLabel)
//        annotationLabel.numberOfLines = 3
//        annotationLabel.textAlignment = .center
//        annotationLabel.snp.makeConstraints { make in
//            make.height.equalTo(30)
//            make.width.equalTo(100)
//            make.centerX.equalToSuperview().inset(0)
//            make.top.equalToSuperview().inset(20)
//        }
//
//      canShowCallout = true
//      calloutOffset = CGPoint(x: -5, y: 5)
//        let mapsButton = UIButton(frame: CGRect(
//          origin: CGPoint.zero,
//          size: CGSize(width: 48, height: 48)))
//        mapsButton.setBackgroundImage(UIImage(systemName: "house"), for: .normal)
//        rightCalloutAccessoryView = mapsButton
//        let detailLabel = UILabel()
//        detailLabel.numberOfLines = 0
//        detailLabel.font = detailLabel.font.withSize(12)
//        detailLabel.text = artwork.subtitle
//        detailCalloutAccessoryView = detailLabele
//
//        image = UIImage(systemName: "house")
//
//    }
//
//  }
//}

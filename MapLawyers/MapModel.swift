//
//  MapModel.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import Foundation
import MapKit
import Kingfisher
class MapLawyer: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    var ava = UIImageView()
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D,
        ava: UIImageView
        )
    {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.ava = ava
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }


    
}

class ArtworkView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let artwork = newValue as? MapLawyer else {
        return
      }
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.font = detailLabel.font.withSize(12)
        detailLabel.text = artwork.subtitle
        detailCalloutAccessoryView = detailLabel
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
        let mapsButton = UIButton(frame: CGRect(
          origin: CGPoint.zero,
          size: CGSize(width: 48, height: 48)))
        mapsButton.setBackgroundImage(artwork.ava.image, for: .normal)
        rightCalloutAccessoryView = mapsButton

        if artwork.ava.image == nil
        {
            image = UIImage(systemName: "house")
        }
        else {
            image = artwork.ava.image
            transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }
      

    }
  }
}



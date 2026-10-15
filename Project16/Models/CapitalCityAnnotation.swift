//
//  CapitalCityAnnotation.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 15/10/26.
//

import MapKit

final class CapitalCityAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(city: CapitalCityModel) {
        self.title = city.title
        self.coordinate = city.coordinate
        super.init()
    }
}

//
//  CapitalCityAnnotation.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 15/10/26.
//

import MapKit

final class CapitalCityAnnotation: NSObject, MKAnnotation {
    let city: CapitalCityModel
    var title: String? { city.title }
    let coordinate: CLLocationCoordinate2D

    init(city: CapitalCityModel) {
        self.city = city
        self.coordinate = city.coordinate
        super.init()
    }
}

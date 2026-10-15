//
//  CapitalCitiesViewModel.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 14/10/26.
//

import MapKit

final class CapitalCitiesViewModel {

    let cities: [CapitalCityModel] = [
        CapitalCityModel(
            title: "London",
            info: "Capital of England",
            coordinate: CLLocationCoordinate2D(latitude: 51.5072, longitude: -0.1276),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/London")!),
        
        CapitalCityModel(
            title: "Oslo",
            info: "Capital of Norway",
            coordinate: CLLocationCoordinate2D(latitude: 59.9139, longitude: 10.7522),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Oslo")!),
        
        CapitalCityModel(
            title: "Paris",
            info: "Capital of France",
            coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Paris")!),
        
        CapitalCityModel(
            title: "Rome",
            info: "Capital of Italy",
            coordinate: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Rome")!),
        
        CapitalCityModel(
            title: "Washington, D.C.",
            info: "Capital of the United States",
            coordinate: CLLocationCoordinate2D(latitude: 38.9072, longitude: -77.0369),
            wikipediaURL: URL(string: "https://en.wikipedia.org/wiki/Washington,_D.C.")!)
    ]
}

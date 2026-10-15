//
//  ViewController.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 13/10/26.
//
import UIKit
import MapKit

class CapitalCitiesViewController: UIViewController {
    
    private let mapView = MKMapView()
    private let viewModel: CapitalCitiesViewModel

    init(viewModel: CapitalCitiesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureMapView()
        configureAnnotations()
        configureInitialRegion()
        
    }

    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureMapView() {
           view.addSubview(mapView)
           mapView.translatesAutoresizingMaskIntoConstraints = false

           NSLayoutConstraint.activate([
               mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
       }
    
    
    private func configureAnnotations() {
        let annotations = viewModel.cities.map { city in
            let annotation = MKPointAnnotation()
            annotation.title = city.title
            annotation.subtitle = city.info
            annotation.coordinate = city.coordinate
            return annotation
        }

        mapView.addAnnotations(annotations)
    }
    
    
    private func configureInitialRegion() {
        let center = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let span = MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
        let region = MKCoordinateRegion(center: center, span: span)

        mapView.setRegion(region, animated: false)
    }

}



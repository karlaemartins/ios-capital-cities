//
//  ViewController.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 13/10/26.
//
import UIKit
import MapKit

class CapitalCitiesViewController: UIViewController, MKMapViewDelegate {
    
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
           mapView.delegate = self
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else { return nil }

            let identifier = "CapitalCity"

            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKMarkerAnnotationView
                ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)

            annotationView.annotation = annotation
            annotationView.canShowCallout = true
            annotationView.markerTintColor = .systemRed
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

            return annotationView
        }
    
    func mapView(
        _ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl
    ) {
        guard let title = view.annotation?.title ?? nil,
              let city = viewModel.cities.first(where: { $0.title == title }) else {
            return
        }

        showCapitalDetails(title: city.title, subtitle: city.info)
    }

    
    private func showCapitalDetails(title: String, subtitle: String) {
        let alert = UIAlertController(
            title: title,
            message: subtitle,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }


}



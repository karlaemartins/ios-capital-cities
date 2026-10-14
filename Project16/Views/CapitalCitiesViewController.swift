//
//  ViewController.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 13/10/26.
//


import UIKit
import MapKit

class ViewController: UIViewController {
    
    private let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureMapView()
        
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
}



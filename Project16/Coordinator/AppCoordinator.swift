//
//  AppCoordinator.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 15/10/26.
//

import UIKit

final class AppCoordinator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = CapitalCitiesViewModel()
        let viewController = CapitalCitiesViewController(viewModel: viewModel)
        
        viewController.onCapitalSelected = { [weak self] city in
            self?.showWikipedia(for: city)
        }
            
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func showWikipedia(for city: CapitalCityModel) {
            let viewController = CapitalWikiViewController(url: city.wikipediaURL)
            navigationController.pushViewController(viewController, animated: true)
        }
}

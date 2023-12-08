//
//  HomeCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import Foundation
import UIKit

final class HomeTabCoordinator: Coordinator {
    weak var parentCoordinator: MainTabCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeTabViewController = HomeTabViewController()
        homeTabViewController.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(homeTabViewController, animated: true)
    }
    
    func finish() {
        
    }
    
    
}

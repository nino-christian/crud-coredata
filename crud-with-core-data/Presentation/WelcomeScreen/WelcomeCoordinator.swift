//
//  WelcomeCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/7/23.
//

import Foundation
import UIKit

final class WelcomeCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
    
    func finish() {
        
    }
}

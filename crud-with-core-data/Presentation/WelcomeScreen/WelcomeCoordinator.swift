//
//  WelcomeCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/7/23.
//

import Foundation
import UIKit


protocol WelcomeCoordinatorProtocol: Coordinator {
    func startLoginViewController()
}

final class WelcomeCoordinator: WelcomeCoordinatorProtocol {
    weak var parentCoordinator: AppCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print(parentCoordinator?.childCoordinators)
        startLoginViewController()
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.startAuthenticatedFlow()
    }
    
    func startLoginViewController() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
}

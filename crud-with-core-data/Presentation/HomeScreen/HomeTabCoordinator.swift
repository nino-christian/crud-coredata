//
//  HomeCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import Foundation
import UIKit

final class HomeTabCoordinator: NSObject, TabBarCoordinator {
    var viewController: HomeTabViewController
    
    var tabBarItem: UITabBarItem
    
    weak var parentCoordinator: MainTabCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController, tabBarItem: UITabBarItem) {
        self.navigationController = navigationController
        self.tabBarItem = tabBarItem
        self.viewController = ViewControllerFactory.makeHomeTabViewController()
        
        
    }
    
    func start() {
        navigationController.delegate = self
        viewController.tabBarItem = self.tabBarItem
        viewController.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: true)
        
        
    }
    
    func finish() {
        
    }
    
    func childDidFinish(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator else { return }
        removeChildCoordinator(coordinator)
    }
    
}

extension HomeTabCoordinator: UINavigationControllerDelegate {
    
}



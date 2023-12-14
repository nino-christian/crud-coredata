//
//  FeedTabCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import Foundation
import UIKit

final class FeedTabCoordinator: TabBarCoordinator {
    var tabBarItem: UITabBarItem
    
    weak var parentCoordinator: MainTabCoordinator?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController, tabBarItem: UITabBarItem) {
        self.navigationController = navigationController
        self.tabBarItem = tabBarItem
    }

    func start() {
        let addTabViewController = FeedTabViewController()
        addTabViewController.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(addTabViewController, animated: true)
    }
    
    func finish() {
        
    }
    
    
}


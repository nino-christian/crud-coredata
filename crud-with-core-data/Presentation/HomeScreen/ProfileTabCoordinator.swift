//
//  ProfileTabCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/14/23.
//

import Foundation
import UIKit

final class ProfileTabCoordinator: TabBarCoordinator {
    
    var tabBarItem: UITabBarItem
    
    weak var parentCoordinator: MainTabCoordinator?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController, tabBarItem: UITabBarItem) {
        self.navigationController = navigationController
        self.tabBarItem = tabBarItem
    }
    
    func start() {
        
    }
    
    func finish() {
        
    }
    
    
}

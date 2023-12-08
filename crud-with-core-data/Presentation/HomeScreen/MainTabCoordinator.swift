//
//  MainTabCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import Foundation
import UIKit

final class MainTabCoordinator: NSObject, Coordinator{
    weak var parentCoordinator: MainCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabController = MainTabBarController()
        mainTabController.coordinator = self
        
        let homeTabCoordinator = HomeTabCoordinator(navigationController: navigationController)
        homeTabCoordinator.parentCoordinator = self
        homeTabCoordinator.start()
        childCoordinators.append(homeTabCoordinator)
        
        let addTabCoordinator = AddTabCoordinator(navigationController: navigationController)
        addTabCoordinator.parentCoordinator = self
        childCoordinators.append(addTabCoordinator)
        
        mainTabController.viewControllers = [homeTabCoordinator.navigationController,
                                             addTabCoordinator.navigationController]
        
        navigationController.pushViewController(mainTabController, animated: true)
    }
    
    func finish() {
        
    }
    
    func childDidFinish(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator else { return }
        removeChildCoordinator(coordinator)
    }
}

extension MainTabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = tabBarController.viewControllers?.firstIndex(of: viewController) else { return }
        
        let selectedCoordinator = childCoordinators[index]
        childDidFinish(selectedCoordinator)
    }
}

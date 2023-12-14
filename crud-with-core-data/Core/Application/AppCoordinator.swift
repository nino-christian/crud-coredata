//
//  AppFlowCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/7/23.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func startAuthenticationFlow()
    func startAuthenticatedFlow()
}

final class AppCoordinator: NSObject, AppCoordinatorProtocol, UINavigationControllerDelegate {

    let welcomeCoordinator: WelcomeCoordinator
    let tabBarCoordinator: MainTabCoordinator
    
    var childCoordinators = [Coordinator]()
    
    init( welcomeCoordinator: WelcomeCoordinator,
          tabBarCoordinator: MainTabCoordinator
    ) {
        self.welcomeCoordinator = welcomeCoordinator
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        startAuthenticationFlow()
    }
    
    func startAuthenticationFlow() {
        welcomeCoordinator.parentCoordinator = self
        welcomeCoordinator.start()
        childCoordinators.append(welcomeCoordinator)
    }
    
    func startAuthenticatedFlow() {
        tabBarCoordinator.parentCoordinator = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
    
    
    func finish() {
        
    }
    
    func childDidFinish(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator else { return }
        removeChildCoordinator(coordinator)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
    
        switch fromViewController {
        case let welcomeViewController as WelcomeViewController:
            childDidFinish(welcomeViewController.coordinator)
//        case let mainTabController as MainTabBarController:
//            childDidFinish(mainTabController.coordinator)
        default:
            break
        }
    }
}

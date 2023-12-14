//
//  AppFlowCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/7/23.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func loginFlow()
    func mainTabBarFlow()
}

final class AppCoordinator: NSObject, AppCoordinatorProtocol, UINavigationControllerDelegate {
    let welcomeCoordinator: WelcomeCoordinator
    
    var childCoordinators = [Coordinator]()
    
    init( welcomeCoordinator: WelcomeCoordinator
    ) {
        self.welcomeCoordinator = welcomeCoordinator
    }
    
    func start() {
        loginFlow()
    }
    
    func mainTabBarCoordinator() {
//        let mainTabCoordinator = MainTabCoordinator(navigationController: navigationController)
//        mainTabCoordinator.parentCoordinator = self
//        childCoordinators.append(mainTabCoordinator)
//        mainTabCoordinator.start()
    }
    
    func loginFlow() {
        welcomeCoordinator.parentCoordinator = self
        childCoordinators.append(welcomeCoordinator)
        welcomeCoordinator.start()
    }
    
    func mainTabBarFlow() {
        
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

//
//  AppFlowCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/7/23.
//

import Foundation
import UIKit

final class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let child = WelcomeCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func welcomeCoordinator() {
        let child = WelcomeCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func mainTabBarCoordinator() {
        let child = MainTabCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        
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
        
        if let welcomeViewController =  fromViewController as? WelcomeViewController {
            childDidFinish(welcomeViewController.coordinator)
        }
        
        
    }
}

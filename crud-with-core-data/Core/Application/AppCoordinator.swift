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

    let welcomeCoordinator: WelcomeCoordinator!
    let tabBarCoordinator: MainTabCoordinator!
    
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
        childCoordinators.append(welcomeCoordinator)
        welcomeCoordinator.parentCoordinator = self
        welcomeCoordinator.start()
        
    }
    
    func startAuthenticatedFlow() {
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.parentCoordinator = self
        tabBarCoordinator.start()
        
    }
    
    func finish() {
        
    }
    
    func childDidFinish(_ child: Coordinator?) {
        guard let coordinator = child else { return }
        removeChildCoordinator(coordinator)
    }
}

//
//  CoordinatorFactory.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/14/23.
//

import Foundation
import UIKit

class CoordinatorFactory {
    
    func makeAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        let welcomeCoordinator = WelcomeCoordinator(navigationController: navigationController)
        
        return AppCoordinator(welcomeCoordinator: welcomeCoordinator)
    }
}

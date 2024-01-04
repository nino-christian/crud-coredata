//
//  CoordinatorFactory.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/14/23.
//

import Foundation
import UIKit

class CoordinatorFactory {
    
    static func makeAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        let welcomeCoordinator = makeWelcomeCoordinator(navigationController: navigationController)
        let tabBarCoordinator = makeTabBarCoordinator(navigationController: navigationController)
        
        return AppCoordinator(welcomeCoordinator: welcomeCoordinator,
                              tabBarCoordinator: tabBarCoordinator)
    }
    
    static func makeWelcomeCoordinator(navigationController: UINavigationController) -> WelcomeCoordinator {
        let welcomeCoordinator = WelcomeCoordinator(navigationController: navigationController)
        return welcomeCoordinator
    }
    
    static func makeTabBarCoordinator(navigationController: UINavigationController) -> MainTabCoordinator {
        let tabBarController = UITabBarController()
        let tabBarCoordinator = MainTabCoordinator(navigationController: navigationController,
                                                   tabBarController: tabBarController)
        return tabBarCoordinator
    }
    
    static func makeChildTabCoordinators(tabItem: TabBarItem) -> TabBarCoordinator {
        let navigationController = UINavigationController()
        switch tabItem {
        case .home:
            return HomeTabCoordinator(navigationController: navigationController,
                                      tabBarItem: UITabBarItem(title: tabItem.tabItemTitle,
                                                               image: .actions,
                                                               tag: tabItem.tabOrderNumber))
        case .feed:
            return FeedTabCoordinator(navigationController: navigationController,
                                      tabBarItem: UITabBarItem(title: tabItem.tabItemTitle,
                                                               image: .checkmark,
                                                               tag: tabItem.tabOrderNumber))
        case .profile:
            return ProfileTabCoordinator(navigationController: navigationController,
                                         tabBarItem: UITabBarItem(title: tabItem.tabItemTitle,
                                                                  image: .remove,
                                                                  tag: tabItem.tabOrderNumber))
        }
    }
}

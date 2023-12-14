//
//  MainTabCoordinator.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import Foundation
import UIKit

enum TabBarItem {
    case home
    case feed
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .feed
        case 2:
            self = .profile
        default:
            return nil
        }
    }
    
    func tabItemTitle() -> String {
        switch self {
        case .home:
            return "Home"
        case .feed:
            return "Feed"
        case .profile:
            return "Profile"
        }
    }
    
    func tabOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .feed:
            return 1
        case .profile:
            return 2
        }
    }
}


protocol TabBarCoordinator: Coordinator {
    var tabBarItem: UITabBarItem { get }
    
    var parentCoordinator: Coordinator? { get set }
}


final class MainTabCoordinator: NSObject, Coordinator{
    weak var parentCoordinator: AppCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    let tabBarController: UITabBarController = .init()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeTabCoordinator = TabBarCoordinatorFactory().makeChildTabCoordinators(tabItem: .home)
        homeTabCoordinator.parentCoordinator = self
        homeTabCoordinator.start()
        childCoordinators.append(homeTabCoordinator)
        
        let addTabCoordinator = FeedTabCoordinator(navigationController: navigationController)
        addTabCoordinator.parentCoordinator = self
        childCoordinators.append(addTabCoordinator)
        
       // mainTabController.viewControllers = [homeTabCoordinator.navigationController,
       //                                      addTabCoordinator.navigationController]
        
        //navigationController.pushViewController(mainTabController, animated: true)
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

class TabBarCoordinatorFactory {
    
    func makeChildTabCoordinators(tabItem: TabBarItem) -> Coordinator {
        let navigationController = UINavigationController()
        switch tabItem {
        case .home:
            return HomeTabCoordinator(navigationController: navigationController,
                                      tabBarItem: UITabBarItem(title: tabItem.tabItemTitle(),
                                                               image: nil,
                                                               tag: tabItem.tabOrderNumber()))
        case .feed:
            return FeedTabCoordinator(navigationController: navigationController,
                                      tabBarItem: UITabBarItem(title: tabItem.tabItemTitle(),
                                                               image: nil,
                                                               tag: tabItem.tabOrderNumber()))
        case .profile:
            return ProfileTabCoordinator(navigationController: navigationController,
                                         tabBarItem: UITabBarItem(title: tabItem.tabItemTitle(),
                                                                  image: nil,
                                                                  tag: tabItem.tabOrderNumber()))
        }
    }
}

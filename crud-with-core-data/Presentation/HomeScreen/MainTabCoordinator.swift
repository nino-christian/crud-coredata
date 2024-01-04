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
    
    var tabItemTitle: String {
        switch self {
        case .home:
            return "Home"
        case .feed:
            return "Feed"
        case .profile:
            return "Profile"
        }
    }
    
    var tabOrderNumber: Int {
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
    var navigationController: UINavigationController { get set }
    var parentCoordinator: MainTabCoordinator? { get set }
}


final class MainTabCoordinator: NSObject, Coordinator{
    weak var parentCoordinator: AppCoordinator?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    let tabBarController: UITabBarController
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func start() {
        let tabItems: [TabBarItem] = [.home, .feed, .profile]
            .sorted(by: { $0.tabOrderNumber < $1.tabOrderNumber })
        
        let tabCoordinators: [TabBarCoordinator] = tabItems.compactMap {
            let coordinator = CoordinatorFactory.makeChildTabCoordinators(tabItem: $0)
            return coordinator
        }
        
        for coordinator in tabCoordinators {
            coordinator.parentCoordinator = self
            coordinator.start()
            childCoordinators.append(coordinator)
        }
        
        let tabNavContollers: [UINavigationController] = tabCoordinators.compactMap { $0.navigationController }
    
        prepareTabBarController(withControllers: tabNavContollers)
    }
    
    func finish() {
//        for coordinator in childCoordinators {
//            coordinator.finish()
//        }
//        childCoordinators.removeAll()
    }
    
    private func prepareTabBarController(withControllers tabNavControllers: [UINavigationController]) {
        tabBarController.delegate = self
        tabBarController.selectedIndex = TabBarItem.home.tabOrderNumber
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.setViewControllers(tabNavControllers, animated: false)
        
        self.navigationController.viewControllers = [tabBarController]
        
    
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
}

extension MainTabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = tabBarController.viewControllers?.firstIndex(of: viewController) else { return }
        
        tabBarController.selectedIndex = index
        let selectedCoordinator = childCoordinators[index]
       // childDidFinish(selectedCoordinator)
    }
}



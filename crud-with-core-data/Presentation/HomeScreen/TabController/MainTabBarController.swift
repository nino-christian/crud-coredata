//
//  MainTabBarController.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    weak var coordinator: MainTabCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    private func setupViews() {

    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else { return false }
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.allowAnimatedContent], completion: nil)
        }

        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch selectedIndex {
        case 0:
            self.title = "Students"
            break
        case 1:
            self.title = "Add Student"
            break
        default: break
        }
    }
    
    
}

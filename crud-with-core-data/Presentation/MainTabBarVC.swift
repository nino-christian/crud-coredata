//
//  MainTabBarVC.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/2/23.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        setupViews()
    }
    

    private func setupViews() {
        let firstTabVC = StudentTableTabVC()
        let secondTabVC = AddStudentTabVC()
        
//        let firstTabNavController = UINavigationController(rootViewController: firstTabVC)
//        let secondTabNavController = UINavigationController(rootViewController: secondTabVC)
        
        firstTabVC.tabBarItem = UITabBarItem(title: "Students", image: nil, tag: 0)
        secondTabVC.tabBarItem = UITabBarItem(title: "Add Student", image: nil, tag: 1)
        
        self.viewControllers = [firstTabVC, secondTabVC]
        
//        firstTabNavController.navigationBar.prefersLargeTitles = true
//        secondTabNavController.navigationBar.prefersLargeTitles = true
        
        self.selectedIndex = 0
    }
}

extension MainTabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else { return false }
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionFlipFromLeft], completion: nil)
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

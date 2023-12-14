//
//  ViewControllerFactory.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/15/23.
//

import Foundation
import UIKit

protocol ViewControllerFactoryProtocol {
    static func makeHomeTabViewController() -> HomeTabViewController
    static func makeFeedTabViewController() -> FeedTabViewController
    static func makeProfileTabViewController() -> ProfileTabViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    static func makeHomeTabViewController() -> HomeTabViewController {
        let homeViewController = HomeTabViewController()
        return homeViewController
    }
    static func makeFeedTabViewController() -> FeedTabViewController {
        let feedViewController = FeedTabViewController()
        return feedViewController
    }
    static func makeProfileTabViewController() -> ProfileTabViewController {
        let profileViewController = ProfileTabViewController()
        return profileViewController
    }
}

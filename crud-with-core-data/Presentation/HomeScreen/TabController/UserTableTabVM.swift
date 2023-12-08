//
//  viewControllerViewModel.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/1/23.
//

import Foundation
import CoreData

protocol userTableTabViewModelProtocol: AnyObject {
    var onUpdate: (([User]) -> Void)? { get set }
    
    func getAllusers()
    func deleteUser(User: User)
    func updateUser(User: User)
}

class UserTableTabVM: userTableTabViewModelProtocol{
    func getAllusers() {
        
    }
    
    func deleteUser(User: User) {
        
    }
    
    func updateUser(User: User) {
        
    }
    
    var onUpdate: (([User]) -> Void)?
    
//    private var userRepository: CoreDataRepository
    
    private var userList: [User] = [] {
        didSet {
            onUpdate?(userList)
        }
    }
    
//    init(userRepository: CoreDataRepository) {
//        self.userRepository = userRepository
//    }
}

//
//  UserCoreRepoProtocol.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/6/23.
//

import Foundation



protocol UserCoreRepoProtocol {
    func getAll(completion: @escaping (Result<[User?], Error>) -> Void)
    func get(withName name: String, completion: @escaping (Result<User?, Error>) -> Void)
    func create(user: User, completion: @escaping (Result<Bool, Error>) -> Void)
    func delete(user: User, completion: @escaping (Result<Bool, Error>) -> Void)
    func update(user: User, completion: @escaping (Result<Bool, Error>) -> Void)
}

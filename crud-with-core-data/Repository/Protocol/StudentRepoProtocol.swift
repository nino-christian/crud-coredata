//
//  StudentRepoProtocol.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/2/23.
//

import Foundation

typealias GetCompletion = (([Student]?) -> Void)

protocol StudentRepoProtocol {
    func getAllStudents(completion: @escaping GetCompletion)
    func createStudent(firstName: String, lastName: String, age: Int32)
    func deleteStudent(student: Student)
    func updateStudent(student: Student, newStudentInfo: Student)
}

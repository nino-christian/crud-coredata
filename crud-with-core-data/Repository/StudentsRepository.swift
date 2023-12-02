//
//  StudentsRepository.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/2/23.
//

import Foundation
import CoreData

class StudentsRepository: StudentRepoProtocol {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    func getAllStudents(completion: @escaping GetCompletion) {
        let fetchRequest = NSFetchRequest<Student>(entityName: "Student")
        
        do {
            let students = try context.fetch(fetchRequest)
            completion(students)
        } catch {
            print("Failed to fetch students: \(error)")
        }
        completion(nil)
    }
    
    func createStudent(firstName: String, lastName: String, age: Int32) {
        let student = Student(context: context)
        student.firstName = firstName
        student.lastName = lastName
        student.age = age
        student.createdAt = Date()
        student.updatedAt = Date()
        
        CoreDataManager.shared.saveContext()
    }
    
    func deleteStudent(student: Student) {
        context.delete(student)
        CoreDataManager.shared.saveContext()
    }
    
    func updateStudent(student: Student, newStudentInfo: Student) {
        student.firstName = newStudentInfo.firstName
        student.lastName = newStudentInfo.lastName
        student.age = newStudentInfo.age
        student.updatedAt = Date()
        
        CoreDataManager.shared.saveContext()
    }
    
    
}


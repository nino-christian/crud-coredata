//
//  viewControllerViewModel.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/1/23.
//

import Foundation
import CoreData


class StudentTableVM {
    let studentRepository: StudentsRepository
    
    init(studentRepository: StudentsRepository) {
        self.studentRepository = studentRepository
    }
    
    func getAllStudents() {
        print("Get students")
    }
}

//
//  ViewController.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/1/23.
//

import UIKit

class StudentRecordViewController: UIViewController{
    let students: [Student] = []
    
    let studentRepository: StudentsRepository = StudentsRepository()
    
    var viewModel: VCViewModel!
  
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StudentTableViewCell.self, forCellReuseIdentifier: StudentTableViewCell.identifier)

        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = VCViewModel(studentRepository: studentRepository)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupViews()
        
        getStudentsData()
    }

    private func getStudentsData() {
        viewModel.getAllStudents()
    }
    
    private func setupViews() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
 
extension StudentRecordViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.identifier, for: indexPath) as? StudentTableViewCell else {
            return UITableViewCell()
        }
        cell.setCellValues(student: students[indexPath.row])
        
        return cell
    }
    
}

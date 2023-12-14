//
//  HomeTabViewController.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import UIKit

class HomeTabViewController: UIViewController {
    weak var coordinator: HomeTabCoordinator?
    
    
    let students: [Student] = []
    
   // var studentRepository: CoreDataRepository?
    
    var viewModel: UserTableTabVM?
  
//    init(studentRepository: CoreDataRepository, viewModel: UserTableTabVM) {
//        self.studentRepository = studentRepository
//        self.viewModel = viewModel
//
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)

        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        
//        setupViews()
//
//        getStudentsData()
    }

    private func getStudentsData() {
      //  viewModel?.getAllStudents()
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

extension HomeTabViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.setCellValues(student: students[indexPath.row])
        
        return cell
    }
    
}

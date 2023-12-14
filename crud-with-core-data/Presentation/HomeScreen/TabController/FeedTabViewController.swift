//
//  AddTabViewController.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/8/23.
//

import UIKit

class FeedTabViewController: UIViewController {
    weak var coordinator: FeedTabCoordinator?
    
    private var firstNameLabel: AppFormLabel?
    private var firstNameTextField: AppFormTextField?
    
    private var lastNameLabel: AppFormLabel?
    private var lastNameTextField: AppFormTextField?
    
    private var ageLabel: AppFormLabel?
    private var ageTextField: AppFormTextField?
    
    private var addButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FeedTabViewController {
    private func setupViews() {
        self.view.backgroundColor = .systemBackground

        
        setupForm()
    }
    
    private func setupForm() {
        let safeArea = view.safeAreaLayoutGuide

        firstNameLabel = AppFormLabel(text: "First Name")
        firstNameTextField = AppFormTextField(placeHolder: "First Name",
                                              keyboardType: .default)
        lastNameLabel = AppFormLabel(text: "Last Name")
        lastNameTextField = AppFormTextField(placeHolder: "Last Name",
                                             keyboardType: .default)
        ageLabel = AppFormLabel(text: "Age")
        ageTextField = AppFormTextField(placeHolder: "Age",
                                        keyboardType: .decimalPad)
        
        guard let firstNameLabel = firstNameLabel, let firstNameTextField = firstNameTextField, let lastNameLabel = lastNameLabel, let lastNameTextField = lastNameTextField, let ageLabel = ageLabel, let ageTextField = ageTextField else { return }
        
        // FIRST NAME FIELD
        self.view.addSubview(firstNameLabel)
        firstNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeArea.snp.leading).inset(15)
            make.top.equalTo(safeArea.snp.top).inset(15)
            make.trailing.equalTo(safeArea.snp.trailing).inset(15)
        }
        self.view.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
            make.leading.equalTo(firstNameLabel.snp.leading)
            make.top.equalTo(firstNameLabel.snp.bottom).offset(8)
            make.trailing.equalTo(firstNameLabel.snp.trailing)
        }
        
        // LAST NAME FIELD
        self.view.addSubview(lastNameLabel)
        lastNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(firstNameTextField.snp.leading)
            make.top.equalTo(firstNameTextField.snp.bottom).offset(16)
            make.trailing.equalTo(firstNameTextField.snp.trailing)
        }
        self.view.addSubview(lastNameTextField)
        lastNameTextField.snp.makeConstraints { make in
            make.leading.equalTo(lastNameLabel.snp.leading)
            make.top.equalTo(lastNameLabel.snp.bottom).offset(8)
            make.trailing.equalTo(lastNameLabel.snp.trailing)
        }
        
        // AGE FIELD
        self.view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.leading.equalTo(lastNameTextField.snp.leading)
            make.top.equalTo(lastNameTextField.snp.bottom).offset(16)
            make.trailing.equalTo(lastNameTextField.snp.trailing)
        }

        self.view.addSubview(ageTextField)
        ageTextField.snp.makeConstraints { make in
            make.leading.equalTo(ageLabel.snp.leading)
            make.top.equalTo(ageLabel.snp.bottom).offset(8)
            make.trailing.equalTo(ageLabel.snp.trailing)
        }
    }
}

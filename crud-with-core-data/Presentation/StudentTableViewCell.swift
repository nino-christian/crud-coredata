//
//  StudentTableViewCell.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/2/23.
//

import UIKit
import SnapKit

class StudentTableViewCell: UITableViewCell {

    static let identifier: String = "StudentTableViewCell"
    
    private var nameLabel: UILabel        = UILabel()
    private var ageLabel: UILabel         = UILabel()
    private var createdDateLabel: UILabel = UILabel()
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    private func setupView(){
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(18)
            make.width.equalToSuperview().priority(.required)
        }
        
        self.contentView.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.textColor = .black
        ageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        ageLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(16)
            make.width.equalToSuperview().priority(.required)
        }
        
        self.contentView.addSubview(createdDateLabel)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        createdDateLabel.textColor = .gray
        createdDateLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        createdDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(ageLabel.snp.bottom).offset(8)
            make.height.equalTo(14)
            make.width.equalToSuperview().priority(.required)
        }
    }
}

extension StudentTableViewCell {
    func setCellValues(student: Student) {
        nameLabel.text = "Full name: \(student.firstName!) \(student.lastName!)"
        ageLabel.text = "Age: \(student.age)"
        createdDateLabel.text = "Created at: \(student.createdAt!)"
    }
}

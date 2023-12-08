//
//  WelcomeViewController.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/7/23.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    weak var coordinator: WelcomeCoordinator?
    
    private let titleLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        viewDidDisappear(animated)
//        coordinator?.finish()
//    }
    
    private func setupViews() {
        self.view.backgroundColor = .white
        
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "WELCOME SCREEN"
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}

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
    private let navButton: UIButton = UIButton()
    
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(25)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(navButton)
        navButton.setTitle("Click me!", for: .normal)
        navButton.setTitleColor(.black, for: .normal)
        navButton.addTarget(self, action: #selector(navigateTo), for: .touchUpInside)
        navButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(15)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    @objc func navigateTo() {
        coordinator?.finish()
    }
    
    deinit {
        print("Welcome Controller is deallocated")
    }
}

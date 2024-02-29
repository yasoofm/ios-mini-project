//
//  DetailsViewController.swift
//  HRApp
//
//  Created by yousef mandani on 29/02/2024.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    private let image = UIImageView()
    private let container = UIView()
    private let nameLabel = UILabel()
    private let salaryLabel = UILabel()
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()
    private let ibanLabel = UILabel()
    
    var name: String?
    var photo: String?
    var salary: String?
    var phone: String?
    var email: String?
    var iban: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addSubviews()
        setupUI()
        setupLayout()
    }
    
    func setupUI(){
        image.image = UIImage(named: photo?.lowercased() ?? "")
        image.contentMode = .scaleToFill
        
        container.backgroundColor = .lightGray
        container.layer.cornerRadius = 10
        
        nameLabel.text = "Name: ".localized() + (name ?? "no value")
        emailLabel.text = "Email: ".localized() + (email ?? "no value")
        salaryLabel.text = "Salary: ".localized() + (salary ?? "no value")
        ibanLabel.text = "IBAN: ".localized() + (iban ?? "no value")
        phoneLabel.text = "Phone Number: ".localized() + (phone ?? "no value")
    }
    func setupLayout(){
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(350)
        }
        
        container.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(157)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }

        ibanLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }

        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(ibanLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }

    }
    func addSubviews(){
        view.addSubview(image)
        view.addSubview(container)
        
        container.addSubview(nameLabel)
        container.addSubview(salaryLabel)
        container.addSubview(emailLabel)
        container.addSubview(phoneLabel)
        container.addSubview(ibanLabel)
    }
}

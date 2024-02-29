//
//  ViewController.swift
//  HRApp
//
//  Created by yousef mandani on 29/02/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let nameTextField = UITextField()
    private let photoTextField = UITextField()
    private let salaryTextField = UITextField()
    private let emailTextField = UITextField()
    private let phoneTextField = UITextField()
    private let ibanTextField = UITextField()
    private let button = UIButton()
    
    var name: String?
    var photo: String?
    var salary: String?
    var email: String?
    var phone: String?
    var iban: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        setupUI()
        setupLayout()
        setupNavigationBar()
    }

    func setupUI(){
        nameTextField.placeholder = "name".localized()
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.textAlignment = .center
        
        photoTextField.placeholder = "photo".localized()
        photoTextField.backgroundColor = .white
        photoTextField.layer.cornerRadius = 10
        photoTextField.textAlignment = .center
        
        salaryTextField.placeholder = "salary".localized()
        salaryTextField.backgroundColor = .white
        salaryTextField.layer.cornerRadius = 10
        salaryTextField.textAlignment = .center
        
        emailTextField.placeholder = "email".localized()
        emailTextField.backgroundColor = .white
        emailTextField.layer.cornerRadius = 10
        emailTextField.textAlignment = .center
        
        phoneTextField.placeholder = "phone".localized()
        phoneTextField.backgroundColor = .white
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.textAlignment = .center
        phoneTextField.delegate = self
        
        ibanTextField.placeholder = "iban".localized()
        ibanTextField.backgroundColor = .white
        ibanTextField.layer.cornerRadius = 10
        ibanTextField.textAlignment = .center
        
        button.setTitle("send".localized(), for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
    }
    func setupLayout(){
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.width.equalTo(200)
        }
        
        photoTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
        }
        
        salaryTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(photoTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(salaryTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
        }
        
        ibanTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(ibanTextField.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }
    func addSubviews(){
        view.addSubview(nameTextField)
        view.addSubview(photoTextField)
        view.addSubview(salaryTextField)
        view.addSubview(emailTextField)
        view.addSubview(phoneTextField)
        view.addSubview(ibanTextField)
        view.addSubview(button)
    }
    
    @objc func buttonPress(){
        name = nameTextField.text
        photo = photoTextField.text
        salary = salaryTextField.text
        email = emailTextField.text
        phone = phoneTextField.text
        iban = ibanTextField.text
        
        let detailsVC = DetailsViewController()
        detailsVC.name = name
        detailsVC.email = email
        detailsVC.iban = iban
        detailsVC.phone = phone
        detailsVC.photo = photo
        detailsVC.salary = salary
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    @objc func iButtonPress(){
        let instructionsVC = InstructionsViewController()
        instructionsVC.modalPresentationStyle = .popover
        self.present(instructionsVC, animated: true)
    }

    func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "exclamationmark"), style: .plain, target: self, action: #selector(iButtonPress))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 16 characters
        return updatedText.count <= 8
    }
}
extension String {
    func localized() -> String{
        return NSLocalizedString(
        self,
        tableName: "Localizable",
        bundle: .main,
        value: self,
        comment: self
        )
    }
}

//
//  InstructionsViewController.swift
//  HRApp
//
//  Created by yousef mandani on 29/02/2024.
//

import UIKit
import SnapKit

class InstructionsViewController: UIViewController {
    
    private let instructionsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        // Do any additional setup after loading the view.
        addSubviews()
        setupUI()
        setupLayout()
    }
    
    func setupUI(){
        instructionsLabel.text = "Text recruiting is a popular way to reach potential job candidates while saving time and money. It can let you know quickly who’s still interested in your position so you can focus their attention on the people who have the greatest chance of accepting your job offer. It also allows you to send automated replies to questions job seekers might have about your position and to remind candidates about upcoming interviews and application steps.This guide reviews what you need to know about text recruiting and how to create successful recruiting campaigns.".localized()


        instructionsLabel.numberOfLines = 0
        instructionsLabel.textColor = .white
    }
    func setupLayout(){
        instructionsLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
    func addSubviews(){
        view.addSubview(instructionsLabel)
    }
}

//
//  MainViewController.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 28/05/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    lazy var inputField = UITextField()
    lazy var categoryField = UITextField()
    lazy var dateField = UITextField()
    lazy var textLabel = UILabel()
    lazy var okButton = UIButton(type: UIButton.ButtonType.system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        inputField.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        inputField.textColor = .white
        inputField.textAlignment = .center
        inputField.keyboardType = .numberPad
        inputField.attributedPlaceholder =
            NSAttributedString(string: "COST",
                               attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray ])
        view.addSubview(inputField)

        categoryField.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        categoryField.textColor = .white
        categoryField.textAlignment = .center
        categoryField.keyboardType = .alphabet
        categoryField.attributedPlaceholder =
            NSAttributedString(string: "CATEGORY",
                               attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray ])
        view.addSubview(categoryField)

        dateField.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        dateField.text = "10/06/2018"
        dateField.textColor = .white
        dateField.textAlignment = .center
        dateField.keyboardType = .alphabet
        dateField.attributedPlaceholder =
            NSAttributedString(string: "date",
                               attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray ])
        view.addSubview(dateField)

        textLabel.text = "Type Sum"
        view.addSubview(textLabel)

        okButton.setTitle("OK", for: .normal)
        okButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        view.addSubview(okButton)

        self.updateViewConstraints()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func updateViewConstraints() {
        inputField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(-50)
        }

        categoryField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.topMargin.equalTo(self.inputField.snp_bottomMargin).offset(10)
        }

        dateField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.topMargin.equalTo(self.categoryField.snp_bottomMargin).offset(10)
        }

        okButton.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(0)
        }

        super.updateViewConstraints()
    }
}

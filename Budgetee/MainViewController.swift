//
//  MainViewController.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 28/05/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//

import UIKit
import SnapKit
import CoreData

class MainViewController: UIViewController {

    let inputField = UITextField()
    let categoryField = UITextField()
    let dateField = UITextField()
    let okButton = UIButton(type: UIButton.ButtonType.system)
    let categoryButton = UIButton(type: UIButton.ButtonType.system)

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
//        categoryField.keyboardType = .alphabet
        categoryField.attributedPlaceholder =
            NSAttributedString(string: "CATEGORY",
                               attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray ])
        view.addSubview(categoryField)

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"

        dateField.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        dateField.text = formatter.string(from: Date())
        dateField.textColor = .white
        dateField.textAlignment = .center
//        dateField.keyboardType = .alphabet
        dateField.attributedPlaceholder =
            NSAttributedString(string: "DATE",
                               attributes: [ NSAttributedString.Key.foregroundColor: UIColor.gray ])
        view.addSubview(dateField)

        okButton.setTitle("OK", for: .normal)
        okButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        view.addSubview(okButton)

        categoryButton.setTitle("CATEGORIES", for: .normal)
        categoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        view.addSubview(categoryButton)

        self.updateViewConstraints()
    }

    override func updateViewConstraints() {
        inputField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-50)
        }

        categoryField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.topMargin.equalTo(inputField.snp_bottomMargin).offset(10)
        }

        dateField.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.topMargin.equalTo(categoryField.snp_bottomMargin).offset(10)
        }

        okButton.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.topMargin.equalTo(dateField.snp_bottomMargin).offset(50)
        }

        categoryButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp_bottomMargin).offset(0)
        }

        super.updateViewConstraints()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc func okButtonTapped() {
        let category = Category(context: CoreDataController.shared.managedContext)
        category.name = categoryField.text ?? "Empty"
        category.parentCategory = nil
        try? category.managedObjectContext?.save()
    }

    @objc func categoryButtonTapped() {
        let navigationController = UINavigationController(rootViewController: CategoriesViewController())
        present(navigationController, animated: true, completion: nil)
    }
}

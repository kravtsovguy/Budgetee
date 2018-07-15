//
//  CategoriesViewController.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 10/06/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//

import UIKit
import SnapKit

class CategoriesViewController: UITableViewController {

    let parentCategory: Category?
    var categories: [Category] {
        didSet {
            tableView.reloadData()
        }
    }
    lazy var managedObject = CoreDataController.shared.managedContext

    init(withParentCategory parentCategory: Category?) {
        self.parentCategory = parentCategory
        self.categories = []
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(withParentCategory: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

        categories = loadSubCategories(forCategory: parentCategory)
    }

    func loadSubCategories(forCategory category: Category?) -> [Category] {
        let fetchRequest = Category.fetchRequest
        fetchRequest.predicate = NSPredicate(format: "parentCategory == %@", argumentArray: [category ?? NSNull.init()])
        let categories = (try? managedObject.fetch(fetchRequest)) ?? []
        return categories
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) ??
            UITableViewCell(style: .`default`, reuseIdentifier: String(describing: UITableViewCell.self))

        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }

}

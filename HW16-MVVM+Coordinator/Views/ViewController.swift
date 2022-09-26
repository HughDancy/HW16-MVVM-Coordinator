//
//  ViewController.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var coordinator: AppCoordinator?
    var viewModel: TableViewModel?
    
    var users = [User]()
    
    //MARK: - Subview's
    var table: UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.plain)
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    
        return table
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = .white
        title = "Persons"
        setupLayout()
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func bindViewModel() {
        viewModel?.users.bind { user in
            self.users = user ?? someUsers
        }
    }
    
    //MARK: - Setup Layout
    
    func setupLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.icon.image = UIImage(named: users[indexPath.row].userImage)
        cell.label.text = users[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rightIndex = indexPath.row
        coordinator?.show = true
        coordinator?.showUserView()
    }
}



//
//  TableView.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import Foundation
import UIKit

class TableView: UIView {
    
    var delegate: PushViewController?
    
    //MARK: - ViewModel
    
    let viewModel = TableViewModel()
    private var users = [User]()
    
    // MARK: - SubView's
    
    var table: UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.plain)
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    
        return table
    }()
    
    //MARK: - Init
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        bindViewModel()
        addSubview(table)
        setupLayout()
        table.delegate = self
        table.dataSource = self
    }
    
    // MARK: - ViewModel Settings
    
    func bindViewModel() {
        viewModel.users.bind { user in
            
            self.users = user ?? someUsers
            
        }
    }
    
    // MARK: - Setup Layout
    
    func setupLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - TableView Extension

extension TableView: UITableViewDelegate, UITableViewDataSource {
    
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
        print(index)
        let userViewController = UserViewController()
        delegate?.pushToViewController(on: userViewController)
    }
    
}


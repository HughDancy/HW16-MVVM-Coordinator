//
//  ViewController.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: TableView? {
        guard isViewLoaded else { return nil }
        return view as? TableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = TableView()
        title = "Persons"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView?.delegate = self
    }
}

extension ViewController: PushViewController {
    func pushToViewController(on vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


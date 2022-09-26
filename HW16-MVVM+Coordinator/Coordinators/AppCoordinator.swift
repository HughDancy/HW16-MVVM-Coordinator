//
//  AppCoordinator.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var show: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if show == true {
            showUserView()
        } else {
            showTableView()
        }
    }
    
    func showUserView() {
        let vc = UserViewController()
        vc.coordinator = self
        vc.viewModel = TableViewModel()
        vc.viewModel?.isShow = show
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTableView() {
        let vc = ViewController()
        vc.coordinator = self
        vc.viewModel = TableViewModel()
        vc.viewModel?.isShow = show
        navigationController.pushViewController(vc, animated: true)
    }
    
}

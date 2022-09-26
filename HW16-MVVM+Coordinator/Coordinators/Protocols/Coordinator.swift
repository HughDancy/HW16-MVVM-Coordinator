//
//  Coordinator.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

//
//  PushProtocol.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import Foundation
import UIKit

protocol PushViewController {
    var viewModel: TableViewModel { get set }
//    func pushToViewController(on vc: TableViewModel)
}

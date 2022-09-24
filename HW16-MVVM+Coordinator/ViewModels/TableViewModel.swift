//
//  TableViewModel.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import Foundation

final class TableViewModel {
    
    var users = ObservableObject(User.users)

}

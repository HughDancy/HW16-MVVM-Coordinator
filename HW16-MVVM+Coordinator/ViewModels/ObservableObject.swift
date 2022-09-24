//
//  ObservableObject.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import Foundation

final class ObservableObject<T> {
    
    var value: T? {
        didSet {
            listner?(value)
        }
    }
    
    private var listner: ((T?) -> Void)?
    
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listner: @escaping(T?) -> Void) {
        listner(value)
        self.listner = listner
    }
}

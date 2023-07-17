//
//  ViewModel.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import Foundation

class HomeViewModel: ViewModel {
    let delegate: HomeCoordinatorProtocol
    
    init(delegate: HomeCoordinatorProtocol) {
        self.delegate = delegate
        super.init()
    }
    
    func showDailies() {
        self.delegate.showDailies()
    }
    
    func showFinancy() {
        self.delegate.showFinancy()
    }
    
    func showLists() {
        self.delegate.showLists()
    }
}

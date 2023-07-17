//
//  DailyViewModel.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import Foundation

class DailyViewModel: ViewModel {
    let delegate: HomeCoordinatorProtocol
    
    init(delegate: HomeCoordinatorProtocol) {
        self.delegate = delegate
        super.init()
    }
    
    func showDailies() {
        
    }
}

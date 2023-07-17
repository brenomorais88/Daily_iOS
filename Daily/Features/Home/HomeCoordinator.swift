//
//  HomeCoordinator.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import Foundation

import Foundation

protocol HomeCoordinatorProtocol {
    func showDailies()
    func showFinancy()
    func showLists()
}

class HomeCoordinator: Coordinator {
    
    override func didInit() {
        let viewModel = HomeViewModel(delegate: self)
        self.viewController = HomeViewController(viewModel: viewModel)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showDailies() {
        let viewModel = DailyViewModel(delegate: self)
        let vc = DailyViewController(viewModel: viewModel)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func showFinancy() {
        print("f")
    }
    func showLists() {
        print("l")
    }
}

//
//  DailyViewController.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import UIKit

class DailyViewController: ViewController {
    let viewModel: DailyViewModel?
    
    init(viewModel: DailyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = nil
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewCodeSetup()
        self.setupCommonHeader(title: "atividades diarias", showBackButton: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension DailyViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        
    }
    
    func viewCodeConstraintSetup() {
        
    }
}


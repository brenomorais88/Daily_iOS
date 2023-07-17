//
//  HomeViewController.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import UIKit

class HomeViewController: ViewController {
    let viewModel: HomeViewModel?
    
    private let dailyView: CardView = {
        let view = CardView(icon: "daily_icon",
                            text: "atividades \n diarias")
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private let financyView: CardView = {
        let view = CardView(icon: "financy_icon",
                            text: "minhas \n contas")
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private let listsView: CardView = {
        let view = CardView(icon: "list_icon",
                            text: "listas")
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private let dailiesLabel: UILabel = {
        let label = UILabel()
        label.text = "hoje"
        label.textColor = UIColor.primaryColor
        label.font = UIFont.boldTextFont
        return label
    }()
    
    private let dailiesTable: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = UIColor.clear
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    init(viewModel: HomeViewModel) {
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
        self.setupCommonHeader(title: "Bem vindo, Breno", showBackButton: false)
        self.viewCodeSetup()
        self.setupTableView()
        self.setupViewActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupViewActions() {
        
        let listsViewTap = UITapGestureRecognizer(target: self, action:  #selector(showLists))
        listsView.addGestureRecognizer(listsViewTap)
        
        let financyViewTap = UITapGestureRecognizer(target: self, action:  #selector(showFinancy))
        financyView.addGestureRecognizer(financyViewTap)
        
        let dailyViewTap = UITapGestureRecognizer(target: self, action:  #selector(showDailies))
        dailyView.addGestureRecognizer(dailyViewTap)
    }
    
    private func setupTableView() {
        dailiesTable.delegate = self
        dailiesTable.dataSource = self
        dailiesTable.register(HomeDailieCell.self,
                              forCellReuseIdentifier: HomeDailieCell.cellID)
        dailiesTable.reloadData()
    }
    
    //MARK: actions
    @objc private func showDailies() {
        self.viewModel?.showDailies()
    }
    
    @objc private func showFinancy() {
        self.viewModel?.showFinancy()
    }
    
    @objc private func showLists() {
        self.viewModel?.showLists()
    }
}

extension HomeViewController: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.contentView.addSubview(dailyView)
        self.contentView.addSubview(listsView)
        self.contentView.addSubview(financyView)
        self.contentView.addSubview(dailiesLabel)
        self.contentView.addSubview(dailiesTable)
    }
    
    func viewCodeConstraintSetup() {
        let viewWidth = UIScreen.main.bounds.width
        let cardsSpace = viewWidth - 80
        let cardsWidth = cardsSpace / 3
        
        listsView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(headerView.snp.bottom).inset(50)
            make.left.equalToSuperview().inset(24)
            make.height.width.equalTo(cardsWidth)
        }
//
        dailyView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(headerView.snp.bottom).inset(50)
            make.left.equalTo(listsView.snp.right).inset(-16)
            make.height.width.equalTo(cardsWidth)
        }
//
        financyView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(headerView.snp.bottom).inset(50)
            make.left.equalTo(dailyView.snp.right).inset(-16)
            make.height.width.equalTo(cardsWidth)
        }

        dailiesLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(24)
            make.top.equalTo(financyView.snp.bottom).inset(-24)
        }

        dailiesTable.snp.makeConstraints { (make) -> Void in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(dailiesLabel.snp.bottom).inset(-20)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeDailieCell.cellID,
                                                    for: indexPath) as? HomeDailieCell {
            cell.setup()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
}

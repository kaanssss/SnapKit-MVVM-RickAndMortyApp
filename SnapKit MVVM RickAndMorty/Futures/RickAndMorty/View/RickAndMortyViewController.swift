//
//  RickAndMortyViewController.swift
//  SnapKit MVVM RickAndMorty
//
//  Created by Kaan Yalçınkaya on 2.09.2022.
//

import UIKit
import SnapKit


protocol RickandMortyOutPut {
    func changeLoading(isLoading: Bool)
    func saveDatas(values: [Result])
}


final class RickAndMortyViewController: UIViewController {
    
    lazy var results: [Result] = []
    
    lazy var viewModel: IRickandMortyViewModel = RickandMortyViewModel()
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Rick and Morty"
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        return indicator
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RickandMortyTableViewCell.self, forCellReuseIdentifier: RickandMortyTableViewCell.Identifier.custom.rawValue)
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configure()
        setUpContainerView()
        setUpLabelTitle()
        setUpTableView()
        setUpIndicator()
        viewModel.setDelegate(outPut: self)
        viewModel.fetchItems()
        
    }
    
    
    //MARK: - addSubView
    
    private func configure() {
        view.addSubview(containerView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(tableView)
        containerView.addSubview(indicator)
        
    }
    
}


extension RickAndMortyViewController: RickandMortyOutPut {
    func changeLoading(isLoading: Bool) {
        isLoading ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
        
    }
    
    
}
//MARK: - Const Func
extension RickAndMortyViewController {
    
    
    fileprivate func setUpContainerView() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    fileprivate func setUpLabelTitle() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    fileprivate func setUpTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
            
        }
    }
    
    fileprivate func setUpIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
    
}

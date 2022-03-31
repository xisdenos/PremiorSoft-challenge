//
//  ApiTableViewScreen.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import UIKit

class ApiTableViewScreen: UIView {
    
    lazy var tabelView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        return tableView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        setUpConstraints()
    }
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tabelView.delegate = delegate
        self.tabelView.dataSource = dataSource
    }
    
    func addSubView() {
        self.addSubview(self.tabelView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.tabelView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tabelView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.tabelView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.tabelView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}

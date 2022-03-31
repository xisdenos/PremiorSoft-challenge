//
//  NotificationDetailCellTableViewCell.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import UIKit

class NotificationDetailCellTableViewCell: UITableViewCell {

    static let identifier:String = "NotificationDetailCellTableViewCell"
    
    lazy var IdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .red
        
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        
        return label
    }()
    
    lazy var notificationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        
        self.contentView.addSubview(self.IdLabel)
        self.contentView.addSubview(self.contentLabel)
        self.contentView.addSubview(self.notificationImageView)
    }
    
    public func setUpCell(data: Content) {
        self.IdLabel.text = data.id
        self.contentLabel.text = data.content
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.IdLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.IdLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.IdLabel.heightAnchor.constraint(equalToConstant: 40),
            
            self.contentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.IdLabel.leadingAnchor.constraint(equalTo: self.IdLabel.trailingAnchor, constant: 20)
            
        ])
    }
}

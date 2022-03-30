//
//  FirstScreen.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import UIKit

protocol registerActionProtocol: AnyObject {
    func requestAPI()
}

class FirstScreen: UIView {
    
    private weak var delegate: registerActionProtocol?
    
    func delegate(delegate: registerActionProtocol?) {
        self.delegate = delegate
    }
    
    
    lazy var requestLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Clique pra fazer o request"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        
        return label
    }()
    
    lazy var requestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Request API", for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tappedRequestButton), for: .touchUpInside)
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.superView()
    }
    
    private func superView() {
        self.backgroundColor = .white
        self.addSubview(requestLabel)
        self.addSubview(requestButton)
        setUpConstraints()
    }
    
    @objc func tappedRequestButton() {
        print("tapped")
        self.delegate?.requestAPI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.requestLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.requestLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.requestButton.topAnchor.constraint(equalTo: self.requestLabel.bottomAnchor, constant: 25),
            self.requestButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.requestButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.requestButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

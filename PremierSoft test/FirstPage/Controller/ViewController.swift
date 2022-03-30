//
//  ViewController.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import UIKit

class RequesterView: UIViewController {
    
    var fisrtScreen: FirstScreen?
    
    override func loadView() {
        super.loadView()
        self.fisrtScreen = FirstScreen()
        self.view = self.fisrtScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


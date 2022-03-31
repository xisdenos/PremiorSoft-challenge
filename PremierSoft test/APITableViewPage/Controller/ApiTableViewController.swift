//
//  ApiTableViewController.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import UIKit

class ApiTableViewController: UIViewController {
    
    var ApiScreen: ApiTableViewScreen?
    var notificationsData: Any = []
    
    override func loadView() {
        super.loadView()
        self.ApiScreen = ApiTableViewScreen()
        self.view = ApiScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.ApiScreen?.configTableViewDelegate(delegate: self, dataSource: self)
        Task {
            
            do {
                let notifications = try await NotificationsFetcher.fetchNotifications()
                notificationsData = notifications
                print(notificationsData)
            } catch {
                print("Request failed with error \(error)")
            }
        }
        //print(notificationsData)
        // Do any additional setup after loading the view.
    }
}

extension ApiTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color: [UIColor] = [.orange, .blue, .green, .magenta]
        let cell: UITableViewCell = UITableViewCell()
        cell.backgroundColor = color[indexPath.row]
        return cell
    }
    
    
}

//
//  ApiTableViewController.swift
//  PremierSoft test
//
//  Created by Lucas Pinto on 30/03/22.
//

import UIKit

class ApiTableViewController: UIViewController {
    
    var ApiScreen: ApiTableViewScreen?
    var notificationsData: Notifications?
    var notificationCount: Int?
    
    override func loadView() {
        super.loadView()
        self.ApiScreen = ApiTableViewScreen()
        self.view = ApiScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            
            do {
                let notifications = try await NotificationsFetcher.fetchNotifications()
                notificationsData = notifications
                notificationCount = notificationsData!.notifications.count
            } catch {
                print("Request failed with error \(error)")
            }
        }
        self.view.backgroundColor = .red
        self.ApiScreen?.configTableViewDelegate(delegate: self, dataSource: self)
        
        //print(notificationsData)
        // Do any additional setup after loading the view.
    }
}

extension ApiTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NotificationDetailCellTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NotificationDetailCellTableViewCell.identifier, for: indexPath) as? NotificationDetailCellTableViewCell
        cell?.setUpCell(data: notificationsData!.notifications[indexPath.row])
        
        return cell!
    }
    
    
}

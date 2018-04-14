//
//  ChatRoomViewController.swift
//  SocketChat
//
//  Created by Matthew Harrilal on 4/13/18.
//  Copyright © 2018 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

class ChatRoomViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = TableViewDataSource(items: [TextMessage]())

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self.dataSource
        
        dataSource.configureCell = {(tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatRoomTableViewCell
            let message = self.dataSource.items[indexPath.row]
            cell.authorOfMessageLabel.text = message.authorOfMessage
            cell.textOfMessageLabel.text = message.textOfMessage
            return cell
        }
    }
 
}

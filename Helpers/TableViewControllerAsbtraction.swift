//
//  TableViewControllerAsbtraction.swift
//  SocketChat
//
//  Created by Matthew Harrilal on 4/13/18.
//  Copyright © 2018 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit

// Making an alias for the configuration of the cell for row at table view method
typealias TableViewCellCallBack = (UITableView, IndexPath) -> UITableViewCell

class TableViewDataSource<Items>: NSObject, UITableViewDataSource {
    
    // Declaring an array of the given item in replace of the generic
    var items = [Items]()
    
    // Declaring a property that is going to be the abstraction of our table view cell
    var configureCell: TableViewCellCallBack?
    
    init(items: [Items]) {
        self.items = items
    }
    
    // Static Property
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Dynamic property depending on the number of the items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Checks if there is a cell to be configured must pass precondition in order to move foward in progress
        guard let configureCell = configureCell else {
            precondition(false, "Cell needs to be present to be configured")
        }
        return configureCell(tableView, indexPath)
    }
}

//
//  ViewController.swift
//  Todoey
//
//  Created by Matt Cosgrove on 5/27/19.
//  Copyright © 2019 Cosgrove Guitar Studio. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK - Tableview Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        //tableView.cellForRow(at: indexPath)?.backgroundColor = .red
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            //If you tap on hte cell it will add a checkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            // If you tap again it will remove the checkmark.
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        //this statement makes it so the cell doesn't not stay gray.
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
}


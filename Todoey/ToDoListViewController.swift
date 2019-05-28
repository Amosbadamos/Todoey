//
//  ViewController.swift
//  Todoey
//
//  Created by Matt Cosgrove on 5/27/19.
//  Copyright © 2019 Cosgrove Guitar Studio. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
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
    
    //MARK = Add new Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //local variable to pass what is in the "aler.addTextField" line to the "let action = UIAlertAction" line
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            //print(textField.text)
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}


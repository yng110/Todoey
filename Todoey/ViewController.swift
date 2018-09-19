//
//  ViewController.swift
//  Todoey
//
//  Created by Ishii Yugo on 2018/09/18.
//  Copyright © 2018年 yugo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   var itemArray = ["FUCK YOU", "KILL EVERYONE", "KIDDING ME?"]
    
   let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }

   //MARK - Table View DataSrouce Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
   
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
    
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: Any) {
        
       var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
       
        alert.addAction(action)
        
        alert.addTextField { (alertTextFIeld) in
            alertTextFIeld.placeholder = "Create new item"
            textField = alertTextFIeld
        }
        
        
        
        present(alert, animated: true,completion: nil)
        
        
        
    }
    
    
}


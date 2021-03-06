//
//  ViewController.swift
//  Todoey
//
//  Created by Ishii Yugo on 2018/09/18.
//  Copyright © 2018年 yugo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

//   var itemArray = ["FUCK YOU", "KILL EVERYONE", "KIDDING ME?"]
var itemArray = [Item]()
    
   let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "FUCK YOU"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "KILL EVERYONE"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "KIDDING ME?"
        itemArray.append(newItem3)
        
        
        
        
                if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
                    itemArray = items
                }
    }

   //MARK - Table View DataSrouce Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
       
        //Ternary operator
        
        cell.accessoryType =  item.done ? .checkmark : .none
    
        return cell
    }
   
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
    
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: Any) {
        
       var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the Add Button
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
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


//
//  MainVC.swift
//  ShoppingListApp
//
//  Created by Jeffrey Lai on 11/1/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    var listOfItems:[Item] = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()
    }

    func setupNavBar() {
        title = "Shopping List"
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = .systemRed
        navigationController?.navigationBar.isTranslucent = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToList))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearList))
    }
    
    func setupTableView() {
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Item")
    }
    
    @objc func addToList() {
        createAlertController(title: "Create New Item")
    }
    
    @objc func clearList() {
        listOfItems = [Item]()
        tableView.reloadData()
        createAlertMessage(title: "List Cleared")
    }
    
    func createAlertController(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add to List", style: .default) { [weak self, weak ac] _ in
            guard let submission = ac?.textFields?[0].text else { return }
            self?.appendToList(submission)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func createAlertMessage(title: String) {
        let alertMessage = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alertMessage.addAction(doneAction)
        present(alertMessage, animated: true)
    }
    
    func appendToList(_ itemToAdd: String) {
        let defaultPrice = 0.00
        let defaultDescription = "Item Description"
        
        let newItem:Item = Item(itemPrice: defaultPrice, itemName: itemToAdd, itemDescription: defaultDescription)
        listOfItems.insert(newItem, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: "Item")
        let currentItem:Item = listOfItems[indexPath.row]
        cell.textLabel?.text = currentItem.name
        cell.detailTextLabel?.text = currentItem.description
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

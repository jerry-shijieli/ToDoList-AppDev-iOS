//
//  ItemTableViewController.swift
//  ToDoList
//
//  Created by Shijie Li on 8/10/16.
//  Copyright © 2016 Shijie Li. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    var items = [Item]()
    
    func loadSampleItems() {
        items += [Item(name:"Item1"), Item(name:"Item2"), Item(name:"Item3")]
    }
    
    @IBAction func unwindToList(sender: UIStoryboardSegue){
        let srcViewCon = sender.sourceViewController as? ViewController
        let item = srcViewCon?.item
        if (srcViewCon != nil && item?.name != ""){
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                // Update an existing item
                items[selectedIndexPath.row] = item!
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add a new item
                let newIndexPath = NSIndexPath(forRow: items.count, inSection: 0)
                items.append(item!)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleItems()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ItemTableViewCell

        // Configure the cell...
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail"{
            let detailVC = segue.destinationViewController as! ViewController
            // Get the cell that generated the segue
            if let selectedCell = sender as? ItemTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedCell)!
                let selectedItem = items[indexPath.row]
                detailVC.item = selectedItem
            }
        } else if segue.identifier == "AddItem" {
            // No code
        }
    }
    

}

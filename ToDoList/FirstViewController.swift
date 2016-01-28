//
//  FirstViewController.swift
//  ToDoList
//
//  Created by aziz omar boudi  on 1/27/16.
//  Copyright © 2016 jogabo. All rights reserved.
//

import UIKit


// outside the class so that the 2nd VC can acces
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

  @IBOutlet weak var toDoListTable: UITableView!


  override func viewDidLoad() {
    super.viewDidLoad()

    // if NSUserDefaults called toDoList exists (!= nil)
    // so we set our toDoList = to it ( permanent storage )
    // otherwise we leave it empty, it means our user didn't have any items yet

    if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil) {

      toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]

    }

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return toDoList.count

  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let cell = UITableViewCell(style: .Default, reuseIdentifier: "itemCell")
    cell.textLabel?.text = toDoList[indexPath.row]
    return cell

  }


  func tableView(tableView: UITableView, commitEditingStyle editingStyle:
    UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){

      if editingStyle == UITableViewCellEditingStyle.Delete {

        toDoList.removeAtIndex(indexPath.row)

        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")

        toDoListTable.reloadData()
      }

  }

  // reload the table data in viewDidAppear so that they are not lost when we switch from 2nd VC to 1st VC
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
      toDoListTable.reloadData()

  }




}


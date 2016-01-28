//
//  SecondViewController.swift
//  ToDoList
//
//  Created by aziz omar boudi  on 1/27/16.
//  Copyright © 2016 jogabo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


  @IBOutlet weak var item: UITextField!

  @IBAction func addItem(sender: AnyObject) {
    // add the item to the array located in 1st VC above the class
    toDoList.append(item.text!)

    // clear the text field so that the user can enter a new text
    item.text = ""

    // update NSUserDefault and save our array (permanent storage)
    NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  // Tap outside of the keyboard dismisses the keyboard
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.view.endEditing(true)

  }

  // close the keyboard using the button on the keyboard
  func textFieldShouldReturn(textField: UITextField!) -> Bool {

    item.resignFirstResponder()
    return true
  }



}


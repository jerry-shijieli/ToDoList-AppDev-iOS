//
//  ViewController.swift
//  ToDoList
//
//  Created by Shijie Li on 8/9/16.
//  Copyright © 2016 Shijie Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var item = Item?()

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*@IBAction func setLabelText(sender: UIButton) {
        //nameLabel.text = nameTextField.text
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            item = Item(name: name)
        }
    }
}


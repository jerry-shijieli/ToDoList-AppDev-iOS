//
//  ViewController.swift
//  ToDoList
//
//  Created by Shijie Li on 8/9/16.
//  Copyright © 2016 Shijie Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func setLabelText(sender: UIButton) {
        nameLabel.text = nameTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


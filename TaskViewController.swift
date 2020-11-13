//
//  TaskViewController.swift
//  SimpleList
//
//  Created by 稲富祐輔 on 2020/11/05.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        label.numberOfLines = 0
        label.sizeToFit()
    }
}

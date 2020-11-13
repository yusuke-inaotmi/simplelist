//
//  EntryViewController.swift
//  SimpleList
//
//  Created by 稲富祐輔 on 2020/11/05.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    @objc func saveTask() {
        guard let text = field.text, !text.isEmpty else {
            return
        }
        guard (UserDefaults().value(forKey: "count") as? Int) != nil else {
            return
        }
        var tasks = UserDefaults.standard.array(forKey: "tasks") as? [String] ?? []
        tasks.append(text)
        UserDefaults.standard.set(tasks, forKey: "tasks")
        update?()
        navigationController?.popViewController(animated: true)
    }
}

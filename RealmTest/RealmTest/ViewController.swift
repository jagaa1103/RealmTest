//
//  ViewController.swift
//  RealmTest
//
//  Created by Enkhjargal Gansukh on 17/06/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var realmService: RealmService!
    var tableView: UserTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.realmService = RealmService()
        initUserTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func addUser(_ sender: Any) {
        self.view.endEditing(true)
        if idTextField.text != "", nameTextField.text != "" {
            self.realmService.addUser(id: idTextField.text!, name: nameTextField.text!)
            initUserTable()
        }else{
            showAlert(message: "Please insert id & name")
        }
        self.idTextField.text = ""
        self.nameTextField.text = ""
    }
    
    func initUserTable(){
        let users = Array(self.realmService.getUserList())
        if users.count > 0{
            let viewSize = CGRect(x: 0, y: self.view.frame.height - 250, width: self.view.frame.width, height: 250)
            if self.tableView == nil {
                self.tableView = UserTable(frame: viewSize, users: users.reversed())
                self.view.addSubview(self.tableView)
            }else{
                self.tableView.users = users.reversed()
                self.tableView.reloadData()
            }
        }
    }
    
    func showAlert(message: String){
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertView = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}


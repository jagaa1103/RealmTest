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
        let users = Array(self.realmService.getUserList())
        if users.count > 0{
            initTableView(users: users)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func addUser(_ sender: Any) {
        if let id = idTextField.text, let name = nameTextField.text {
            self.realmService.addUser(id: id, name: name)
        }
    }
    
    func initTableView(users: Array<User>){
        print(users.count)
        let viewSize = CGRect(x: 0, y: self.view.frame.height - 250, width: self.view.frame.width, height: 250)
        self.tableView = UserTable(frame: viewSize, users: users)
        self.view.addSubview(self.tableView)
    }
}


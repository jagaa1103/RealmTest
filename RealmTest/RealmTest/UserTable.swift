//
//  UserTable.swift
//  RealmTest
//
//  Created by Enkhjargal Gansukh on 17/06/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit


class UserTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    var users = Array<User>()
    var tableSize: CGRect!
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    init(frame: CGRect, users: Array<User>) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        self.users = users
        self.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        self.delegate = self
        self.dataSource = self
        self.tableSize = frame
        
        let recog = UISwipeGestureRecognizer(target: self, action: Selector(("swipedOnTable")))
//        let recog = UISwipeGestureRecognizer(target: self, action: Selector("swipedTableCell"))
        self.addGestureRecognizer(recog)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func swipedOnTable(recognizer: UIGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.ended {
            let location = recognizer.location(in: self)
            if let swipedCellIndex = self.indexPathForRow(at: location){
                print(self.users[swipedCellIndex.row].id)
            }
        }
    }

    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        cell.textLabel?.text = "id: " + users[indexPath.row].id + ", name: " + users[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        RealmService.instance.deleteUser(user: users[indexPath.row])
        tableView.reloadData()
    }

}

//class UserTableCell: UITableViewCell {
//    var idLabel: UITextView!
//    var nameLabel: UITextView!
//    
////    init(parentSize: CGRect, user: User) {
////        super.init(frame: CGRect(x: 0, y: 0, width: parentSize.width, height: 40))
////        id = UILabel(frame: CGRect(x: 5, y: 5, width: parentSize.width, height: 20))
////        name = UILabel(frame: CGRect(x: 5, y: 25, width: parentSize.width, height: 20))
////        id.text = user.id
////        name.text = user.name
////    }
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.idLabel = UITextView(frame: CGRect(x: 5, y: 5, width: 300, height: 20))
//        self.nameLabel = UITextView(frame: CGRect(x: 5, y: 25, width: 300, height: 20))
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

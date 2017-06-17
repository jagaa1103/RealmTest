//
//  RealmService.swift
//  RealmTest
//
//  Created by Enkhjargal Gansukh on 17/06/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService: NSObject {
    static let instance = RealmService()
    var realm: Realm!
    
    override init() {
        realm = try! Realm()
        super.init()
    }
    
    func addUser(id: String, name: String){
        let user = User()
        user.id = id
        user.name = name
        try! realm.write(){
//            realm.create(User.self, value: user)
            realm.add(user)
        }
        
    }
    
    func getUserList() -> Results<User>{
        return realm.objects(User.self)
    }
    
    func deleteUser(user: User){
        try! realm.write {
            realm.delete(user)
        }
    }
}

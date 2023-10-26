//
//  RealmStorage.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import RealmSwift


class RealmStorage {
    static let shared = RealmStorage()
    
    
    private init() {
    }
    
    func storeObjects<T: Object>(_ objects: List<T>) throws {
        let realm = try Realm()
        for object in objects {
            try realm.write {
                realm.add(object)
            }
        }
    }
    /**
     This method will get data from realm's DataBase
     - Returns: Array of Results..
     */
    func getObjectsFromDB(_ type: Object.Type) throws -> Results<Object> {
        let realm = try Realm()
        return realm.objects(type)
    }
    
    func deleteAll() throws {
        let realm = try Realm()
        try realm.write {
            realm.deleteAll()
        }
    }
}


//
//  ArrayObjectRealm.swift
//  FlatPDFScan
//
//  Created by Coder on 28/2/2023.
//

import Foundation
import RealmSwift

// 元素为对象的数组存储
open class ArrayObjectRealm<T: Object>: RealmManager {
    
    // 增
    open func insert(_ t: T) {
        try? realm.write {
            realm.add(t)
        }
    }
    
    // 删
    open func delete(_ t: T) {
        try? realm.write {
            realm.delete(t)
        }
    }
    
    // 删除所有
    open func deleteAll() {
        try? realm.write {
            for item in allValue() {
                realm.delete(item)
            }
        }
    }
    
    // 更新
    open func update(t: T,_ callback: (T) -> ()) {
        try? realm.write{ callback(t)  }
    }
    
    // 查所有对象
    open func allValue() -> [T] {
        var ts: [T] = []
        realm.objects(T.self).forEach { t in
            ts.append(t)
        }
        return ts
    }
    
    // 查某个主键值为'key'的对象
    open func value(from key: String) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }
}

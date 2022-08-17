//
//  SingleObjectRealm.swift
//  Database
//
//  Created by chaopeng_coder on 2022/3/31.
//

import Foundation
import RealmSwift

// 单个对象的存储
open class SingleObjectRealm<T: Object>: RealmManager {
    
    // 存储
    open func save(_ t: T) {
        delete()
        try? realm.write({ realm.add(t) })
    }
    
    // 获取
    open func value() -> T? {
        return realm.objects(T.self).first
    }
    
    // 删除
    open func delete() {
        try? realm.write({
            realm.delete(realm.objects(T.self))
        })
    }
    
    // 更新
    open func update(_ callback: (T) -> ()) {
        guard let t = value() else { return }
        try? realm.write{ callback(t)  }
    }
}

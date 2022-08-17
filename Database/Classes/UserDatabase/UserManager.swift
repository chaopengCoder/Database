//
//  UserDB.swift
//  Database
//
//  Created by chaopeng_coder on 2022/3/31.
//

import Foundation

public class UserManager: SingleObjectRealm<User> {
    public static let shared = UserManager()
    
    // 访问User
    public var user: User?
    
    // 是否登录
    public var isLogin = false
    
    fileprivate override init() {
        super.init()
        user = value()
        isLogin = user != nil
    }
    
    // 保存User
    public override func save(_ t: User) {
        super.save(t)
        user = t
        isLogin = true
    }
    
    // 删除User
    public override func delete() {
        super.delete()
        user = nil
        isLogin = false
    }
    
    // 获取User
    public override func value() -> User? {
        return super.value()
    }
}

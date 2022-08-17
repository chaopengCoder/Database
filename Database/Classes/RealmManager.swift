//
//  RealmManager.swift
//  Database
//
//  Created by chaopeng_coder on 2022/3/31.
//

import Foundation

import RealmSwift

open class RealmManager: NSObject {
    public var realm: Realm!
    
    public override init() {
        do {
            realm = try Realm(name: "your_realm_name")
        } catch {
            print("open realm error = \(error.localizedDescription)")
        }
    }
    
    // 更新数据库版本
    // 只要数据模型有变动就必须升级数据库版本
    // 每次上线版本都会默认用最新的版本号作为数据库版本号, 例如: 1.2.0 对应数据库版本号: 102000
    static public func update(realmVersion: UInt64) {
        let config = Realm.Configuration(
            schemaVersion: realmVersion,
            migrationBlock: { migration, oldSchemaVersion in }
        )
        
        Realm.Configuration.defaultConfiguration = config
    }
}

extension Realm {

    public init(name: String) throws {
        // 找到沙盒路径 这里是Document
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                          .userDomainMask,
                                                          true).first!
        // 拼接自己的路径
        let dbPath = docPath + "/db/" + name
        // 创建文件夹
        if !FileManager.default.fileExists(atPath: dbPath) {
            try FileManager.default.createDirectory(atPath: dbPath,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
        }
        // 根据路径创建自己的realm文件URL
        let url = URL(string: dbPath + "/" + name + ".realm")
        try self.init(fileURL: url!)
    }
}

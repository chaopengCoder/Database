//
//  FileModel.swift
//  Database
//
//  Created by Coder on 28/2/2023.
//

import RealmSwift
import ObjectMapper

public class FileModel: Object, Mappable {
    
    // 文件名称
    @Persisted public var name = ""
    // 文件创建时间
    @Persisted public var date = Date()
    // 第二名称
    @Persisted public var secondName = ""
    
    // 设置主键
    public override class func primaryKey() -> String? {
        return "name"
    }
    
    public override init() {
        super.init()
    }
    
    /// 以下两个函数为ObjectMapper 协议方法
    public required init?(map: ObjectMapper.Map) { }
    
    public func mapping(map: ObjectMapper.Map) {
        name <- map["name"]
        date <- map["date"]
        secondName <- map["secondName"]
    }
}

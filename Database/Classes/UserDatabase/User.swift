//
//  User.swift
//  Database
//
//  Created by chaopeng_coder on 2022/3/31.
//

import Realm
import RealmSwift
import Foundation
import ObjectMapper

public class User: Object, Mappable {

    @Persisted public var name = ""
    @Persisted public var userId = 0
    @Persisted public var account = ""
    @Persisted public var headUrl = ""
    @Persisted public var birthday = ""
    
    required override init() { }
    
    required public init?(map: ObjectMapper.Map) { }

    public func mapping(map: ObjectMapper.Map) {
        name <- map["name"]
        userId <- map["userid"]
        account <- map["account"]
        headUrl <- map["head_url"]
        birthday <- map["birthday"]
    }
}

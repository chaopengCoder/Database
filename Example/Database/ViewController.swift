//
//  ViewController.swift
//  Database
//
//  Created by chaopeng on 03/31/2022.
//  Copyright (c) 2022 chaopeng. All rights reserved.
//

import UIKit
import Database
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let info = Bundle.main.infoDictionary
        if let versionStr = info?["CFBundleShortVersionString"] as? String {
            let vs = versionStr
                .split(separator: ".")
                .map { (version) -> Substring in
                    var v = version
                    if v.count == 1 { v.append("0") }
                    return v
                }
                .joined()
            if let versionInt = UInt64(vs) {
                print("RealmVersion = \(versionInt)")
                RealmManager.update(realmVersion: versionInt)
            }
        }
        // 模拟服务端返回的用户数据
        let userJson: [String: Any] = [
            "name": "空格格",
            "userid": "12345",
            "account": "18790737838",
            "birthday": "2022/7/17",
            "head_url": "https: www.xxx.com/user/head"]
        
        // 转换成对象
        if let user = Mapper<User>().map(JSON: userJson) {
            // 存储到数据库
            UserManager.shared.save(user)
        }
        print(NSHomeDirectory())
        // 删除
        UserManager.shared.delete()
        UserManager.shared.update { (user) in
            user.name = "张三"
        }
    }
}

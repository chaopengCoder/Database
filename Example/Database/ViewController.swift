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

    @IBOutlet weak var iMainTb: UITableView!
    
    var count = 0
    var deleteCount = 0
    
    @IBAction func insertFile(_ sender: Any) {
        
        if FilesManager.shared.allValue().isEmpty {
            count = 0
            deleteCount = 0
        }
        
        let file = [
            "name": "YourSummer\(count)",
            "date": Date(),
            "secondName": "Realm"
        ] as [String: Any]
        
        if let fileModel = Mapper<FileModel>().map(JSON: file) {
            // 存储到数据库
            FilesManager.shared.insert(fileModel)
            
            iMainTb.reloadData()
        }
        
        count += 1
    }
    
    @IBAction func deleteFile(_ sender: Any) {
        guard let model = FilesManager.shared.value(from: "YourSummer\(deleteCount)") else { return }
        FilesManager.shared.delete(model)
        iMainTb.reloadData()
        deleteCount += 1
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        
        FilesManager.shared.deleteAll()
        iMainTb.reloadData()
    }
    @IBAction func updateFile(_ sender: Any) {
        guard let model = FilesManager.shared.value(from: "YourSummer0") else { return }
        FilesManager.shared.update(t: model) { m in
            m.date = Date()
            m.secondName = "modified"
        }
        iMainTb.reloadData()
    }
    @IBAction func fetchfile(_ sender: Any) {
        let model = FilesManager.shared.value(from: "YourSummer0")
        let message = model != nil ? model!.description : "查询无结果"
        let alert = UIAlertController(title: "主键查询结果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    @IBAction func fetchAll(_ sender: Any) {
        let all = FilesManager.shared.allValue()
        let names = all.map{ $0.name }
        
        let alert = UIAlertController(title: "查询所有", message: names.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 单个对象存储的使用
    func saveSingleObject() {
        // 模拟服务端返回的用户数据
        let userJson: [String: Any] = [
            "name": "空格格",
            "userid": "12345",
            "account": "18790737838",
            "birthday": "2022/7/17",
            "head_url": "https: www.xxx.com/user/head"]
        
        // 转换成对象
        if let user = Mapper<User>().map(JSON: userJson) {
            // 1. 存储到数据库
            UserManager.shared.save(user)
        }
        /**
         // 2.删除
         UserManager.shared.delete()
         */
        
        /**
         // 3.更新
         UserManager.shared.update { (user) in
         user.name = "张三"
         }
         */
        
        /**
         // 4. 访问用户对象
         let user = UserManager.shared.user
         print("\(user?.birthday ?? "")")
         */
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FilesManager.shared.allValue().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath) as! FileCell
        let model = FilesManager.shared.allValue()[indexPath.row]
        cell.iNameLb.text = model.name
        cell.iDateLb.text = model.date.string()
        cell.iSecondNameLb.text = model.secondName
        return cell
    }
}

extension Date {
    
    func string(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}

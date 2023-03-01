//
//  FilesManager.swift
//  Database
//
//  Created by Coder on 28/2/2023.
//

import RealmSwift
import Foundation

public class FilesManager: ArrayObjectRealm<FileModel> {
    // 单例访问
    public static let shared = FilesManager()
    
    // 数组, 方便访问
    public var files: [FileModel] = []
    
    public override init() {
        super.init()
        files = allValue()
    }
    
    /// 给数组插入新对象
    public override func insert(_ t: FileModel) {
        super.insert(t)
        files = allValue()
    }
    
    /// 删除数组中指定对象
    public override func delete(_ t: FileModel) {
        super.delete(t)
        files = allValue()
    }
    
    /// 删除数组中指定对象
    public override func deleteAll() {
        super.deleteAll()
        files = allValue()
    }
    
    /// 更新数组中某个对象
    public override func update(t: FileModel, _ callback: (FileModel) -> ()) {
        super.update(t: t, callback)
        files = allValue()
    }
    
    /// 通过主键过去某个对象
    public override func value(from key: String) -> FileModel? {
        return super.value(from: key)
    }
}

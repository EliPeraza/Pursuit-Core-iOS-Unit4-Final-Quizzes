//
//  UserLoginInfo.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/4/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class UserLoginDataManager {
  
  static let filename = "UserLoginList.plist"
  private static var loginInfo = [UserLogginInfoModel]()
  
  private init() {}
  
  static func saveLoginInfo() {
    let path =  DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    print("I have a path: \(path)")
    
    do {
      let data = try PropertyListEncoder().encode(loginInfo)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch {
      print("property list encoding error: \(error)")
    }
  }
  
  static func getLoginInfo() -> [UserLogginInfoModel] {
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    
    if FileManager.default.fileExists(atPath: path) {
      if let data = FileManager.default.contents(atPath: path) {
        do {
          loginInfo = try PropertyListDecoder().decode([UserLogginInfoModel].self, from: data)
        } catch {
          print("property list decoding error: \(error)")
        }
      } else {
        print("getFavoriteQuizzed data: is nil")
      }
    } else {
      print("\(filename) does not exist")
    }
    return loginInfo
  }
  
  static func addUser(user: UserLogginInfoModel) {
    loginInfo.append(user)
    saveLoginInfo()
  }
  
  static func deleteUser(atIndex index: Int) {
    loginInfo.remove(at: index)
    saveLoginInfo()
  }
  
  
}

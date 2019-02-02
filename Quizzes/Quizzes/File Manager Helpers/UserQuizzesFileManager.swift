//
//  UserQuizzesFileManager.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class UserQuizzesFileManager {

  static let filename = "UserQuizzesList.plist"
  private static var quizzItems = [UserStoredQuizzesModel]()
  
  private init() {}
  
  static func saveFavoriteQuizzes() {
    let path =  DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    print("I have a path: \(path)")
    
    do {
      let data = try PropertyListEncoder().encode(quizzItems)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch {
      print("property list encoding error: \(error)")
    }
  }
  
  static func getFavoriteQuizzes() -> [UserStoredQuizzesModel] {
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    
    if FileManager.default.fileExists(atPath: path) {
      if let data = FileManager.default.contents(atPath: path) {
        do {
          quizzItems = try PropertyListDecoder().decode([UserStoredQuizzesModel].self, from: data)
        } catch {
          print("property list decoding error: \(error)")
        }
      } else {
        print("getFavoriteQuizzed data: is nil")
      }
    } else {
      print("\(filename) does not exist")
    }
    quizzItems = quizzItems.sorted{$0.createdAt.date() > $1.createdAt.date()}
    return quizzItems
  }
  
  static func addEntry(quiz: UserStoredQuizzesModel) {
    quizzItems.append(quiz)
    saveFavoriteQuizzes()
  }
  
  static func delete(atIndex index: Int) {
   quizzItems.remove(at: index)
    saveFavoriteQuizzes()
  }

  
}

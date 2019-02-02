//
//  UserStoredQuizzesModel.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct UserStoredQuizzesModel: Codable {
  let imageData: Data
  let createdAt: String
  let id: String
  let quizTitle: String
  let facts: [String]
}


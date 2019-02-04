//
//  UserImageModel.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct UserLogginInfoModel: Codable {
  let id: String
  let createdAt: String
  let userImage: Data
  let userName: String
  
}

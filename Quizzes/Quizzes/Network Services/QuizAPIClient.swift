//
//  QuizAPIClient.swift
//  Quizzes3//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizAPIClient {

  static func getQuizData(completionHandler: @escaping (AppError?, [Quiz]?) -> Void){
    
    let urlString = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
    
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (appError, facts) in
      if let appError = appError {
        completionHandler(appError, nil)
      }
      if let facts = facts {
        do {
          let factsData = try JSONDecoder().decode([Quiz].self, from: facts)
          completionHandler(nil, factsData)
        } catch {
          completionHandler(AppError.jsonDecodingError(error), nil)
        }
      }
    }
}

}

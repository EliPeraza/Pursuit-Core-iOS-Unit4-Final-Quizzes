//
//  CreateController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateController: UIViewController {
  
  let createQuiz = CreateQuizView()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = #colorLiteral(red: 0.6349781752, green: 1, blue: 0.4726830721, alpha: 1)
      navigationItem.title = "Quiz Creation Central"
      
      view.addSubview(createQuiz)
    }
  

    



}

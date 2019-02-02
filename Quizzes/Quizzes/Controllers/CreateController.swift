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

      view.backgroundColor = .white
      navigationItem.title = "Quiz Creation Central"
      
      view.addSubview(createQuiz)
    }
  

    



}

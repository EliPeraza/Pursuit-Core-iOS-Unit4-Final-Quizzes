//
//  QuizzesController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesController: UIViewController {
  
  let quizView = QuizzesView()

    override func viewDidLoad() {
        super.viewDidLoad()
      
    view.backgroundColor = #colorLiteral(red: 0, green: 0.8047454953, blue: 1, alpha: 1)
      navigationItem.title = "My Quizzes"
      
      self.view.addSubview(quizView)
      self.quizView.myQuizzesCollectionView.register(MyQuizCollectionCell.self, forCellWithReuseIdentifier: "QuizCollectionCell")

    }
  
}


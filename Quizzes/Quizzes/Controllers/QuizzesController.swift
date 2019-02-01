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
      self.quizView.myQuizzesCollectionView.dataSource = self
      self.quizView.myQuizzesCollectionView.delegate = self

    }
  
}

extension QuizzesController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = quizView.myQuizzesCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionCell", for: indexPath) as? MyQuizCollectionCell else {return UICollectionViewCell() }
    cell.backgroundColor = .white
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     return CGSize(width: 190, height: 300)
  }

  
  
 

}


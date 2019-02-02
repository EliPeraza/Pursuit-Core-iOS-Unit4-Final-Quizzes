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
  
  var quizzes = [UserQuizzesFileManager]() {
    didSet {
      DispatchQueue.main.async {
        self.quizView.myQuizzesCollectionView.reloadData()
      }
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
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
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    
    cell.moreActionsButton.tag = indexPath.row
    cell.moreActionsButton.addTarget(self, action: #selector(actionButtonPressed(_:)), for: .touchUpInside)
    
    
    return cell
  }
  
  @objc func actionButtonPressed(_ sender: UIButton) {
    
    let index = sender.tag
    
    let actionSheet = UIAlertController(title: "", message: "Choose an option:", preferredStyle: .actionSheet)
    
    let delete = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive) { (delete) in
      UserQuizzesFileManager.delete(atIndex: index)
      // call function to get data and reload
      
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (cancel) in
      self.dismiss(animated: true, completion: nil)
    }
    
    actionSheet.addAction(delete)
    actionSheet.addAction(cancel)
    
    present(actionSheet, animated: true)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 190, height: 300)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//    let quizToSegue = quizzes[indexPath.row]
    guard let cell = quizView.myQuizzesCollectionView.cellForItem(at: indexPath) as? MyQuizCollectionCell else { print("didSelectItemAt cell nil")
      return
    }
    
    let detailedVC = DetailQuizzController()
    
    navigationController?.pushViewController(detailedVC, animated: true)
    
  }
}


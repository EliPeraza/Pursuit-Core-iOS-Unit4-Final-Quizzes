//
//  DetailQuizzController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailQuizzController: UIViewController {
  
  let detailView = DetailQuizView()
  
  var quizPassedFromMyQuizzesTab: UserStoredQuizzesModel?
  var factsArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(detailView)
    detailView.detailCollection.register(DetailCollectionCell.self, forCellWithReuseIdentifier: "DetailCollectionCell")
    
    detailView.detailCollection.delegate = self
    detailView.detailCollection.dataSource = self
    
    if let facts = quizPassedFromMyQuizzesTab?.facts{
      self.factsArray = facts
    }
  }
  
}

extension DetailQuizzController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return factsArray.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = detailView.detailCollection.dequeueReusableCell(withReuseIdentifier: "DetailCollectionCell", for: indexPath) as? DetailCollectionCell else {return UICollectionViewCell()}
    
    cell.layer.cornerRadius = 3.0
    cell.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    cell.layer.borderWidth = 2.0
    
    cell.cellMessage.text = quizPassedFromMyQuizzesTab?.quizTitle
    
    
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //TODO animate cell when selecting
    
    //first make sure you have a cell
    guard let cell = detailView.detailCollection.cellForItem(at: indexPath) as? DetailCollectionCell else {
      print("didSelectItemAt cell nil")
      return
    }
    
    if indexPath.row == 0 {
      UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromRight], animations: {
        cell.cellMessage.text = self.factsArray[0]
        
      })
    } else if indexPath.row == 1 {
      UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromRight], animations: {
        cell.cellMessage.text = self.factsArray[1]
      })
    }
//    } else {
//      UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
//        cell.cellMessage.text = self.quizPassedFromMyQuizzesTab?.quizTitle
//      })
//    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: detailView.detailCollection.bounds.width - 30, height: (detailView.detailCollection.bounds.height) / 2)
    
  }
  
}


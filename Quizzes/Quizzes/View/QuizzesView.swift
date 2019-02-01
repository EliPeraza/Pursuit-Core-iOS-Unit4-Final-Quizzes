//
//  QuizzesView.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesView: UIView {
  
  lazy var myQuizzesCollectionView: UICollectionView = {
    
    let layoutForCollection = UICollectionViewFlowLayout()
    layoutForCollection.itemSize = CGSize(width: 200, height: 250)
    layoutForCollection.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layoutForCollection)
    collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    return collectionView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setCollectionViewConstraints()
  }
  
  //TODO - CHECK THE ALEX THING WITH THE ADDITIONAL INIT - CHECK THE APP WE DID IN CLASS
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func setCollectionViewConstraints() {
    addSubview(myQuizzesCollectionView)
    myQuizzesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    myQuizzesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    
    myQuizzesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
  
    myQuizzesCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    
    myQuizzesCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
  }
  
  
}

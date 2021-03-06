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
    layoutForCollection.itemSize = CGSize(width: 175, height: 350)
    layoutForCollection.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    
  
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layoutForCollection)
    collectionView.backgroundColor = .white
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
    myQuizzesCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    myQuizzesCollectionView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    
  }
  
  
  
}

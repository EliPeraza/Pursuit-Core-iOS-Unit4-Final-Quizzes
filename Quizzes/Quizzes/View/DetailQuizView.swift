//
//  SettingsView.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailQuizView: UIView {
  
  
  lazy var detailCollection: UICollectionView = {
    
    let detailCollectionLayout = UICollectionViewFlowLayout()
    detailCollectionLayout.itemSize = CGSize(width: 200, height: 200)
    detailCollectionLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: detailCollectionLayout)
    
    collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    return collectionView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupDetailCollectionConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupDetailCollectionConstraints(){
    addSubview(detailCollection)
    detailCollection.translatesAutoresizingMaskIntoConstraints = false
    detailCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    
    detailCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    
    detailCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    
    detailCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
  }
  
  
}

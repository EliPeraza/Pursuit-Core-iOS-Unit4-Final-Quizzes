//
//  SearchView.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {

  lazy var searchCollectionView: UICollectionView = {
    
    let searchCollectionLayout = UICollectionViewFlowLayout()
    searchCollectionLayout.itemSize = CGSize(width: 200, height: 200)
    searchCollectionLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
    
    let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: searchCollectionLayout)
    
    collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    return collectionView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSearchCollectionConstraints(){
   addSubview(searchCollectionView)
    searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
    searchCollectionView.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 1).isActive = true
    searchCollectionView.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 1).isActive = true
    
  }
  
}

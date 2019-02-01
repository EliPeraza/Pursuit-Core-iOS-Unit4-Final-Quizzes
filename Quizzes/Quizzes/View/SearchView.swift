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
    setupSearchCollectionConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSearchCollectionConstraints(){
   addSubview(searchCollectionView)
    searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
    searchCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    
    searchCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    
    searchCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    
    searchCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
  }
  
}

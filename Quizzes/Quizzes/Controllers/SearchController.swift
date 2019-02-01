//
//  SearchController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
  
  let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.757725656, alpha: 1)
      navigationItem.title = "Search Quizzes Online"
      
      view.addSubview(searchView)
      searchView.searchCollectionView.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "SearchCollectionCell")
      
      searchView.searchCollectionView.dataSource = self
      searchView.searchCollectionView.delegate = self
      
    }
  
}

extension SearchController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = searchView.searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else {return UICollectionViewCell()}
    cell.backgroundColor = .white
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: searchView.searchCollectionView.bounds.width - 30, height: (searchView.searchCollectionView.bounds.height) / 2)
  }
  

}

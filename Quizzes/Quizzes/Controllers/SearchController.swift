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
  
  var factsFromInternet = [Quiz]() {
    didSet{
      DispatchQueue.main.async {
        self.searchView.searchCollectionView.reloadData()
      }
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Search Quizzes Online"
      
      view.addSubview(searchView)
      searchView.searchCollectionView.register(SearchCollectionCell.self, forCellWithReuseIdentifier: "SearchCollectionCell")
      
      searchView.searchCollectionView.dataSource = self
      searchView.searchCollectionView.delegate = self
      
      getFacts()
    }
  
  func getFacts() {
    QuizAPIClient.getQuizData { (appError, factsData) in
      if let appError = appError {
       print(appError.errorMessage())
      }
      if let data = factsData {
       self.factsFromInternet = data
      }
    }
  }
  
}

extension SearchController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return factsFromInternet.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = searchView.searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionCell else {return UICollectionViewCell()}
    cell.backgroundColor = .white
    
    let currentFact = factsFromInternet[indexPath.row]
    
    cell.searchLabel.text = currentFact.quizTitle
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: searchView.searchCollectionView.bounds.width - 30, height: (searchView.searchCollectionView.bounds.height) / 2)
  }
  

}

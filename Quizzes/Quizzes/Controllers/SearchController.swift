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
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    cell.layer.cornerRadius = 15.0
    
    
    let currentFact = factsFromInternet[indexPath.row]
    
    cell.searchLabel.text = currentFact.quizTitle
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: searchView.searchCollectionView.bounds.width - 30, height: (searchView.searchCollectionView.bounds.height) / 2)
  }
  

}

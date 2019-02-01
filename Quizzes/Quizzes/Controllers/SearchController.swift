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
      
    }
    

 

}

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

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      
      view.addSubview(detailView)
      detailView.detailCollection.register(DetailCollectionCell.self, forCellWithReuseIdentifier: "DetailCollectionCell")
      
    }
    

  

}

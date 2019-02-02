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
      
      detailView.detailCollection.delegate = self
      detailView.detailCollection.dataSource = self
    }
  
}

extension DetailQuizzController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 2
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = detailView.detailCollection.dequeueReusableCell(withReuseIdentifier: "DetailCollectionCell", for: indexPath) as? DetailCollectionCell else {return UICollectionViewCell()}
    
    cell.layer.cornerRadius = 3.0
    cell.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    cell.layer.borderWidth = 2.0 
    
    return cell
    
    //TODO animate cell when selecting
   
    }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: detailView.detailCollection.bounds.width - 30, height: (detailView.detailCollection.bounds.height) / 2)
    
  }
    
  }



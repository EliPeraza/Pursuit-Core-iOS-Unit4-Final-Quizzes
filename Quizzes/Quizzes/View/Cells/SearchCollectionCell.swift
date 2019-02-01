//
//  SearchCollectionCell.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCollectionCell: UICollectionViewCell {
  
  lazy var addQuizButton: UIButton = {
   
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitle(". . .", for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    
    //    button.addTarget(self, action: #selector(moreActionsButtonPressed), for: .touchUpInside)
    
    return button
    
    
  }()
  
  let searchLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Title for quizz from internet goes here"
    label.textColor = .blue
    
    return label 
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupSearchCellConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension SearchCollectionCell{

  func setupSearchCellConstraints() {
    addQuizButtonConstraints()
    setupSearchLabel()
  
  }
  
  func addQuizButtonConstraints() {
    addSubview(addQuizButton)
   addQuizButton.translatesAutoresizingMaskIntoConstraints = false
    addQuizButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    addQuizButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    
  }
  
  func setupSearchLabel() {
    addSubview(searchLabel)
    searchLabel.translatesAutoresizingMaskIntoConstraints = false
    searchLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 0.5).isActive = true
    searchLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
  }
  


}

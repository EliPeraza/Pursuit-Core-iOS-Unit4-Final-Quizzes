//
//  DetailCollectionCell.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
  
 
  
  lazy var cellMessage: UILabel = {
    let tv = UILabel()
    tv.text = "Enter first fact"
    tv.textAlignment = .justified
    tv.backgroundColor = .white
    tv.numberOfLines = 0
    tv.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    tv.font = UIFont(name: "Thonburi", size: 16)
    return tv
  }()

  
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupCellMessage()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupCellMessage() {
    addSubview(cellMessage)
    cellMessage.translatesAutoresizingMaskIntoConstraints = false
    
    cellMessage.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 0.5).isActive = true
    cellMessage.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 1).isActive = true
    
    cellMessage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    cellMessage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    
  }
}

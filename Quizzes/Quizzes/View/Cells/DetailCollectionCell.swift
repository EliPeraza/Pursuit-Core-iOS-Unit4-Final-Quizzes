//
//  DetailCollectionCell.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
  
 
  
  lazy var cellMessage: UITextView = {
    let tv = UITextView()
    tv.text = "Enter first fact"
    tv.textAlignment = .justified
    tv.backgroundColor = .lightGray
    tv.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
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
    cellMessage.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 0.5).isActive = true
    
    cellMessage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    cellMessage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    
  }
}
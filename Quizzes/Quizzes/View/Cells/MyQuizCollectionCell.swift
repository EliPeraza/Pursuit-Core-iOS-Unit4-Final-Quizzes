//
//  MyQuizCollectionCell.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit



class MyQuizCollectionCell: UICollectionViewCell {
  
  let moreActionsButton: UIButton = {
    
    let button = UIButton()
    button.backgroundColor = .white
    button.setTitle(". . .", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1), for: .normal)
    
    //    button.addTarget(self, action: #selector(moreActionsButtonPressed), for: .touchUpInside)
    return button
    
  }()
  
  lazy var title: UILabel = {
    
    let label = UILabel()
    label.text = "Title for quiz goes here"
    label.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    label.numberOfLines = 0
    label.textAlignment = .justified
    label.font = UIFont(name: "Thonburi", size: 16)
    return label
  }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension MyQuizCollectionCell {
  
  func setupConstraints() {
    titleConstraints()
    moreActionsButtonConstraints()
  }
  
  func titleConstraints() {
    addSubview(title)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 0.5).isActive = true
    title.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
  }
  
  func moreActionsButtonConstraints() {
    addSubview(moreActionsButton)
    moreActionsButton.translatesAutoresizingMaskIntoConstraints = false
    moreActionsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    moreActionsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    
    
  }
  
}

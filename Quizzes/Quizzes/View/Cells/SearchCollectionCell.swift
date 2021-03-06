//
//  SearchCollectionCell.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol SearchCollectionCellDelegate: AnyObject {
  func saveButton(_ searchCollectonCell: SearchCollectionCell, storedQuiz: Quiz)
}

class SearchCollectionCell: UICollectionViewCell {
  
  weak var delegate:  SearchCollectionCellDelegate?
  
  private var currentQuiz: Quiz!
  
  
  lazy var addQuizButton: UIButton = {
    
    let button = UIButton()
    button.backgroundColor = .white
    button.setImage(UIImage(named: "plus"), for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    
    button.addTarget(self, action: #selector(saveQuizButtonPressed), for: .touchUpInside)
    
    return button
    
    
  }()
  
  @objc func saveQuizButtonPressed() {
    delegate?.saveButton(self, storedQuiz: currentQuiz)
  }
  
  lazy var searchLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Title for quizz from internet goes here"
    label.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    label.font = UIFont(name: "Thonburi", size: 16)
    label.numberOfLines = 0 
    return label 
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupSearchCellConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configureCell(storedQuiz: Quiz) {
    currentQuiz = storedQuiz
    searchLabel.text = storedQuiz.quizTitle
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
    searchLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    searchLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11 ).isActive = true
  }
  
  
  
}


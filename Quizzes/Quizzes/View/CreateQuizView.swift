//
//  CreateQuizView.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateQuizView: UIView {
  
  lazy var quizTitle: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Enter quiz title here"
    tf.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    tf.backgroundColor = .white
    tf.font = UIFont(name: "Thonburi", size: 20)
    tf.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    tf.layer.cornerRadius = 3.0
    tf.layer.borderWidth = 1.0
    return tf
    
  }()
  
  lazy var firstFact: UITextView = {
    
    let ff = UITextView()
    ff.textAlignment = .justified
    ff.backgroundColor = .white
    ff.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    ff.font = UIFont(name: "Thonburi", size: 16)
    ff.layer.cornerRadius = 3.0
    ff.layer.borderWidth = 1.0
    ff.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    return ff
  }()
  
  lazy var secondFact: UITextView = {
    let sf = UITextView()
    sf.textAlignment = .justified
    sf.backgroundColor = .white
    sf.textColor = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
    sf.font = UIFont(name: "Thonburi", size: 16)
    sf.layer.cornerRadius = 3.0
    sf.layer.borderWidth = 1.0
    sf.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    return sf
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    quizViewSetup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension CreateQuizView {
  
  func quizViewSetup() {
    
    quizTitleConstraints()
    firstFactConstraints()
    secondFactConstraint()
    
  }
  
  func quizTitleConstraints() {
    addSubview(quizTitle)
    quizTitle.translatesAutoresizingMaskIntoConstraints = false
    quizTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    quizTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    quizTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    
    
  }
  
  func firstFactConstraints() {
    addSubview(firstFact)
    firstFact.translatesAutoresizingMaskIntoConstraints = false
    firstFact.topAnchor.constraint(equalTo: quizTitle.bottomAnchor, constant: 11).isActive = true
    firstFact.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    firstFact.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    firstFact.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
  }
  
  func secondFactConstraint() {
    addSubview(secondFact)
    secondFact.translatesAutoresizingMaskIntoConstraints = false
    secondFact.topAnchor.constraint(equalTo: firstFact.bottomAnchor, constant: 11).isActive = true
    secondFact.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    secondFact.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    secondFact.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
  }
  
}

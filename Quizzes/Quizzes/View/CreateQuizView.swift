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
    tf.placeholder = "Enter quiz title"
    tf.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    tf.backgroundColor = .lightGray
    return tf
    
  }()
  
  lazy var firstFact: UITextView = {
    let ff = UITextView()
    ff.text = "Enter first fact"
    ff.textAlignment = .justified
    ff.backgroundColor = .lightGray
    ff.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    return ff
  }()
  
  lazy var secondFact: UITextView = {
    let sf = UITextView()
    sf.text = "Enter second fact"
    sf.textAlignment = .justified
    sf.backgroundColor = .lightGray
    sf.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    
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

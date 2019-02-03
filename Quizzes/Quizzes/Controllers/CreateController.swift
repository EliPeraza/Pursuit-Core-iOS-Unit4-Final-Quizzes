//
//  CreateController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateController: UIViewController {
  
  let createQuiz = CreateQuizView()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Quiz Creation Central"
      
      view.addSubview(createQuiz)
      
      let createButton = UIBarButtonItem(title: "Create", style: UIBarButtonItem.Style.plain, target: self, action: #selector(createButtonTapped(_:)))
      self.navigationItem.rightBarButtonItem = createButton
      
      
      let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelButtonTapped(_:)))
      self.navigationItem.leftBarButtonItem = cancelButton
      
      
    }
  
  @objc func createButtonTapped(_ sender: UIBarButtonItem!) {
    //Right here I will create the object according to the model and save it to Documents Directory
    // Before saving I need to check that there is text in both text views. Otherwise, display an alert
    
    
    
  }
  
  @objc func cancelButtonTapped(_ sender: UIBarButtonItem!) {
    resignFirstResponder()
    createQuiz.quizTitle.text = ""
    createQuiz.firstFact.text = ""
    createQuiz.secondFact.text = ""
  }
  

    



}

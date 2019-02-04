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
    
    let titleForNewQuiz = createQuiz.quizTitle.text ?? "no title was entered"
    let factOneForNewQuiz = createQuiz.firstFact.text ?? "first fact wasn't entered"
    let factTwoForNewQuiz = createQuiz.secondFact.text ?? "second fact wasn't entered"
    var arrayOfFacts = [String]()
    arrayOfFacts.append(factOneForNewQuiz)
    arrayOfFacts.append(factTwoForNewQuiz)
    let idForObject = UUID().uuidString
    
    //TODO: can I refactor this with array.count???
    
    if !titleForNewQuiz.isEmpty && !factOneForNewQuiz.isEmpty && !factTwoForNewQuiz.isEmpty{
      let newCreatedQuiz = UserStoredQuizzesModel.init(createdAt: Date.getISOTimestamp(), id: idForObject, quizTitle: titleForNewQuiz, facts: arrayOfFacts)
      UserQuizzesFileManager.addEntry(quiz: newCreatedQuiz)
      
      let addedQuizAlert = UIAlertController.init(title: "Quiz was saved", message: nil, preferredStyle: .alert)
      let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
        self.dismiss(animated: true, completion: nil)
        
        //TODO - if saved, send user to MyQuizzes Tab
      }
      
      addedQuizAlert.addAction(ok)
      present(addedQuizAlert, animated: true, completion: nil)
      
    } else if titleForNewQuiz.isEmpty && !factOneForNewQuiz.isEmpty && !factTwoForNewQuiz.isEmpty {
      let titleIsMissing = UIAlertController.init(title: "Title is missing", message: "Please add a title to proceed", preferredStyle: .alert)
      let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
        self.dismiss(animated: true, completion: nil)
      }
      titleIsMissing.addAction(ok)
      present(titleIsMissing, animated: true, completion: nil)
      
    } else if factOneForNewQuiz.isEmpty && !factTwoForNewQuiz.isEmpty && !titleForNewQuiz.isEmpty{
      let factOneIsMissing = UIAlertController.init(title: "First fact is missing", message: "Please add both facts to proceed", preferredStyle: .alert)
      let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
        self.dismiss(animated: true, completion: nil)
      }
      factOneIsMissing.addAction(ok)
      present(factOneIsMissing, animated: true, completion: nil)
    } else if factTwoForNewQuiz.isEmpty && !titleForNewQuiz.isEmpty && !factOneForNewQuiz.isEmpty {
      let factTwoIsMissing = UIAlertController.init(title: "Second fact is missing", message: "Please add both facts to proceed", preferredStyle: .alert)
      let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
        self.dismiss(animated: true, completion: nil)
      }
      factTwoIsMissing.addAction(ok)
      present(factTwoIsMissing, animated: true, completion: nil)
    }
  }
  
  @objc func cancelButtonTapped(_ sender: UIBarButtonItem!) {
    resignFirstResponder()
    createQuiz.quizTitle.text = ""
    createQuiz.firstFact.text = ""
    createQuiz.secondFact.text = ""
  }
  

    



}

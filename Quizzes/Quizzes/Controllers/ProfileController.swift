//
//  ProfileController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
  
  var doesUserNameExist = false
  var usernameEnteredByUser = ""
  
  var profileView = ProfileView()
  
  private var imagePickerController: UIImagePickerController!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    navigationItem.title = "Profile"
    
    view.addSubview(profileView)
    
    createAlertsForProfile()
    
    self.profileView.userNameLabel.text = "Username"

    if let storedUserName = UserDefaults.standard.object(forKey: KeysForUserDefaults.userName) as? String{
      if storedUserName == usernameEnteredByUser {
        profileView.userNameLabel.text = storedUserName
//        let welcomeBackAlert = UIAlertController.init(title: "", message: "Welcome back \(storedUserName)!", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        welcomeBackAlert.addAction(ok)
//        self.present(welcomeBackAlert, animated: true)
      } else {
        profileView.userNameLabel.text = usernameEnteredByUser
        UserDefaults.standard.set(usernameEnteredByUser, forKey: KeysForUserDefaults.userName)
//        let welcomeAlert = UIAlertController.init(title: "", message: "Welcome \(usernameEnteredByUser)!", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        welcomeAlert.addAction(ok)
//        self.present(welcomeAlert, animated: true)
      }
    }
  }

  
  
  func createAlertsForProfile() {
    let alert = UIAlertController.init(title: "Enter User Name", message: "No spaces or special characters allowed", preferredStyle: .alert)
    
    alert.addTextField { (textField) in
      textField.keyboardAppearance = .dark
      textField.keyboardType = .default
      textField.autocorrectionType = .default
      textField.placeholder = "Enter username"
      textField.clearButtonMode = .whileEditing
      
      let cancel = (UIAlertAction(title: "Cancel", style: .cancel, handler: {(action) -> Void in}))
      let submit = (UIAlertAction(title: "Submit", style: .default, handler: { (action) in
        let textField = alert.textFields![1]
        
        if let newUserName = textField.text{
          print("Text field: \(newUserName)")
          self.usernameEnteredByUser = newUserName
        }
      }))
      
      alert.addAction(submit)
      alert.addAction(cancel)
      self.present(alert, animated: true)
    }
  }
  
}


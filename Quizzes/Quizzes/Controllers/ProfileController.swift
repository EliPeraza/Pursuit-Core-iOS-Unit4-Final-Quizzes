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
    
    let existingUsername = UserDefaults.standard.object(forKey: KeysForUserDefaults.userName) as? String ?? "no name stored"
    
    profileView.userNameLabel.text = existingUsername
    
    let alert = UIAlertController.init(title: "Enter User Name", message: "No spaces or special characters allowed", preferredStyle: .alert)
    
    alert.addTextField { (textField) in
      textField.keyboardAppearance = .dark
      textField.keyboardType = .default
      textField.autocorrectionType = .default
      textField.placeholder = "Enter username"
      textField.clearButtonMode = .whileEditing
      
      let cancel = (UIAlertAction(title: "Cancel", style: .cancel, handler: {(action) -> Void in}))
      let submit = (UIAlertAction(title: "Submit", style: .default, handler: { (action) in
        if let  textField = alert.textFields?[0]{
          print("This is textfield \(textField)")
          self.usernameEnteredByUser = textField.text ?? "Nothing"
          self.profileView.userNameLabel.text = self.usernameEnteredByUser
          UserDefaults.standard.set(self.usernameEnteredByUser, forKey: KeysForUserDefaults.userName)
          
          
          if existingUsername.lowercased() == self.usernameEnteredByUser.lowercased() {
            
            let welcomeMessage = UIAlertController.init(title: nil, message: "Thanks for logging in \(self.usernameEnteredByUser)", preferredStyle: .alert)
            
            let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
              self.dismiss(animated: true, completion: nil)
            }
            
            welcomeMessage.addAction(ok)
            self.present(welcomeMessage, animated: true, completion: nil)
            
          }
        }
      }))
      alert.addAction(submit)
      alert.addAction(cancel)
      self.present(alert, animated: true)
    }
    
    
    
  }
}


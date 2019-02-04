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
  private var imagePickerController: UIImagePickerController!
  
  weak var cameraButton: UIBarButtonItem!
  
  var profileView = ProfileView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupPhotoViewController()
    
    
    
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
          
          if existingUsername.lowercased() != self.usernameEnteredByUser.lowercased() {
            
            let welcomeMessage = UIAlertController.init(title: nil, message: "Thanks for logging in \(self.usernameEnteredByUser)", preferredStyle: .alert)
            let ok = UIAlertAction.init(title: "Ok", style: .default) { (okPressed) in
              self.dismiss(animated: true, completion: nil)
            }
            welcomeMessage.addAction(ok)
            self.present(welcomeMessage, animated: true, completion: nil)
          } else if existingUsername.lowercased() == self.usernameEnteredByUser.lowercased(){
            let storedImage = UserLoginDataManager.getLoginInfo()
            let imageFromData = storedImage[0].userImage
            self.profileView.userImage.setImage(UIImage(data: imageFromData), for: .normal)
          }
        }
      }))
      alert.addAction(submit)
      alert.addAction(cancel)
      self.present(alert, animated: true)
    }
    
    profileView.userImage.addTarget(self, action: #selector(photoLibraryButtonPressed(_:)), for: .touchUpInside)
    
  }
  
  
  
}


extension ProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  private func showImagePickerController() {
    present(imagePickerController, animated:  true, completion: nil)
  }
  
  @objc private func photoLibraryButtonPressed(_ sender: UIButton) {
    imagePickerController.sourceType = .photoLibrary
    showImagePickerController()
    
  }
  
  private func setupPhotoViewController() {
    imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let imageToSet = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      profileView.userImage.setImage(imageToSet, for: .normal)
      
      let id = UUID().uuidString
      let userToSave = UserLogginInfoModel.init(id: id, createdAt: Date.getISOTimestamp(), userImage: imageToSet.jpegData(compressionQuality: 0.5) ?? (UIImage(named: "placeholder-image")?.jpegData(compressionQuality: 0.5))! , userName: usernameEnteredByUser)
      
      UserLoginDataManager.addUser(user: userToSave)
      
    } else {
      print("original image is nil")
    }
    dismiss(animated: true, completion: nil)
  }
}

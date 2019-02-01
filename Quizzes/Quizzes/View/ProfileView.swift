//
//  ProfileView.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileView: UIView {

  let userNameLabel: UILabel = {
    
    let label = UILabel()
    label.text = "@ Marcio Damiano"
    label.textColor = #colorLiteral(red: 0.06274510175, green: 0.1205586473, blue: 0.3033512155, alpha: 1)
    label.textAlignment = .center
    return label
  }()
  
  let userImage: UIButton = {
    let imageButton = UIButton()
    imageButton.setImage(UIImage(named: "placeholder-image"), for: .normal)
    return imageButton
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    profileViewSetUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension ProfileView {

  func profileViewSetUp() {
    userNameSetup()
    userImageSetup()
  }
  
  func userImageSetup() {
    addSubview(userImage)
    userImage.translatesAutoresizingMaskIntoConstraints = false
    userImage.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 0.8).isActive = true
    userImage.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 0.5).isActive = true
    userImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    userImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
    
  }
  
  func userNameSetup() {
    addSubview(userNameLabel)
    userNameLabel.translatesAutoresizingMaskIntoConstraints = false
    userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
    userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 11).isActive = true
    userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -11).isActive = true
  }
  
}
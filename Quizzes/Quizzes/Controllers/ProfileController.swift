//
//  ProfileController.swift
//  Quizzes
//
//  Created by Elizabeth Peraza  on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
  
  var profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationItem.title = "Profile"
      
      view.addSubview(profileView)
      
    }
    


}

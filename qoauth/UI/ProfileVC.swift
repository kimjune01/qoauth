//
//  ProfileVC.swift
//  qoauth
//
//  Created by June Kim on 2017-10-06.
//  Copyright © 2017 qi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  var email: String? {
    didSet {
      emailLabel.text = email ?? ""
    }
  }
  
  private let emailLabel = UILabel()
  private let logoutButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Profile"
    layout()
    logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
  }
  
  func layout() {
    emailLabel.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
    emailLabel.text = email ?? "email should be here"
    view.addSubview(emailLabel)
    
    logoutButton.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
    view.addSubview(logoutButton)
    logoutButton.setTitle("Log out", for: .normal)
  }
  
  @objc func didTapLogout() {
    Authenticator.logout() { error in
      
    }
  }
  
}

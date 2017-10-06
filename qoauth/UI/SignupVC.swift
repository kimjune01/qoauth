//
//  File.swift
//  qoauth
//
//  Created by June Kim on 2017-10-06.
//  Copyright © 2017 qi. All rights reserved.
//

import UIKit


class SignupVC: UIViewController {

  private let emailTextField = UITextField()
  private let passwordTextField = UITextField()
  private let signupButton = UIButton(type: .system)
  private let loginButton = UIButton(type: .system)
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Sign up"
    layout()
    signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
    loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
  }
  
  func layout() {
    view.backgroundColor = .white
    emailTextField.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
    emailTextField.placeholder = "email"
    view.addSubview(emailTextField)
    passwordTextField.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
    passwordTextField.placeholder = "password"
    passwordTextField.isSecureTextEntry = true
    view.addSubview(passwordTextField)
    signupButton.frame = CGRect(x: 0, y: 300, width: 200, height: 50)
    signupButton.setTitle("Sign Up", for: .normal)
    view.addSubview(signupButton)
    loginButton.frame = CGRect(x:0, y: 400, width: 200, height: 50)
    loginButton.setTitle("Log in", for: .normal)
    view.addSubview(loginButton)
  }
  
  @objc func signupTapped() {
    guard let email = emailTextField.text,
      let password = passwordTextField.text else {
        return
    }
    Authenticator.signup(email: email, password: password) { error in
      if error != nil {
        self.present(AlertVC(message: error!.localizedDescription), animated: true, completion: nil)
      }
      let profileVC = ProfileViewController()
      profileVC.email = email
      self.navigationController?.pushViewController(profileVC, animated: true)
    }
  }
  
  @objc func loginTapped() {
    navigationController?.popViewController(animated: true)
  }

  //store session once login successful
  
}

//
//  LoginVC.swift
//  qoauth
//
//  Created by June Kim on 2017-10-06.
//  Copyright © 2017 qi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
  /*
   switch is to choose if the current VC is a signup or login
   alert user if email/password is wrong on login view
   alert user if email already exist on signup view
   after login or signup
 */
  private let emailTextField = UITextField()
  private let passwordTextField = UITextField()
  private let loginButton = UIButton(type: .system)
  private let signupButton = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Log in"
    layout()
    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
  }
  
  
  func layout() {
    view.backgroundColor = .white

    emailTextField.frame = CGRect(x: 10, y: 100, width: 200, height: 50)
    emailTextField.placeholder = "email"
    view.addSubview(emailTextField)
    
    passwordTextField.frame = CGRect(x: 10, y: 200, width: 200, height: 50)
    passwordTextField.placeholder = "password"
    passwordTextField.isSecureTextEntry = true
    view.addSubview(passwordTextField)
    
    loginButton.frame = CGRect(x: 10, y: 300, width: 200, height: 50)
    loginButton.setTitle("Log in", for: .normal)
    view.addSubview(loginButton)
    
    signupButton.frame = CGRect(x: 10, y: 400, width: 200, height: 50)
    signupButton.setTitle("Sign up", for: .normal)
    view.addSubview(signupButton)
    
  }
  
  @objc func loginButtonTapped() {
    guard let email = emailTextField.text,
      let password = passwordTextField.text else { return }
    Authenticator.login(email: email, password: password) { error in
      guard let error = error else {
        //TODO: login failed. show alert
        return
      }
      //TODO: store session once login successful

    }
  }

  @objc func signupButtonTapped() {
    navigationController?.pushViewController(SignupVC(), animated: true)
  }
  
  
}

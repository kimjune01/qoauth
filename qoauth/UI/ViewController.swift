//
//  ViewController.swift
//  qoauth
//
//  Created by June Kim on 2017-10-06.
//  Copyright © 2017 qi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var nav: UINavigationController!

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    view.addSubview(loadingIndicator)
    loadingIndicator.center = view.center
    loadingIndicator.startAnimating()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    Authenticator.checkToken() { error in
      if error == nil {
        self.nav = UINavigationController(rootViewController: ProfileViewController())
      } else {
        self.nav = UINavigationController(rootViewController: LoginVC())
      }
      self.present(self.nav, animated: true, completion: nil)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


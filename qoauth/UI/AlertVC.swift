//
//  AlertVC.swift
//  qoauth
//
//  Created by June Kim on 2017-10-06.
//  Copyright © 2017 qi. All rights reserved.
//

import UIKit

func AlertVC(message: String) -> UIAlertController {
  let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
  return alert
}

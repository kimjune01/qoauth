//
//  Authenticator.swift
//  qoauth
//
//  Created by June Kim on 2017-10-06.
//  Copyright © 2017 qi. All rights reserved.
//

import Foundation
import Alamofire

class Authenticator {
  static let baseUri = URL(string:"https://qileap.auth0.com")!
  private static var baseParams: [String: Any] = [
  "client_id" : "DzX5Np7PyEXMnziG8F3peNnVXhVjJboN",
  "connection" : "Username-Password-Authentication"
  ]

  static func checkToken(_ completion: @escaping ((Error?)->()) ) {
    guard let token = KeychainService.loadPassword() as String? else {
      completion(NSError(
        domain: "Authentication",
        code: 001,
        userInfo: ["reason" : "There's no token to authenticate"]))
      return
    }
    //TODO: validate token with Auth0
    
    
  }
  
  static func login(email: String, password: String, completion: @escaping ((Error?) -> ()) ) {
    let endpoint = baseUri.appendingPathComponent("authorize")
    var params = baseParams
    params["redirect_uri"] =  "deeplink://"
    params["response_type"] = "token"
    params["state"] = "logging_in"
    request(endpoint, method: .get, parameters: baseParams).responseJSON { response in
      
    }
    // seems like allowing password inputs directly is not allowed? should redirect to auth0 page according to:
    // https://auth0.com/docs/api/authentication#database-ad-ldap-passive-
    // if using webviews, must use deep link coming back from auth0 ...
    
  }

  static func signup(email: String, password: String, completion: @escaping ((Error?) -> ()) ) {
    let endpoint = baseUri.appendingPathComponent("dbconnections/signup")
    print("trying to reach endpoint: \(endpoint.absoluteString)")
    var params:[String:Any] = baseParams
    params["email"] = email
    params["password"] = password
    request(endpoint, method: .post, parameters: params).responseJSON { response in
      guard let json = response.result.value as? [String:Any] else {
        completion(NSError(domain: "Authentication", code: 002, userInfo: ["reason": "There was a problem with the authentication server"]))
        return
      }
      guard (json["statusCode"] as? Int) != 400 else {
        completion(NSError(domain: "Authentication", code: 002, userInfo: ["reason": "The user already exists"]))
        return
      }
      if let token = json["_id"] as? NSString {
        KeychainService.savePassword(token: token)
      }
      completion(nil)
    }
  }

  static func logout(_ completion: @escaping ((Error?) -> ())) {
    //TODO:
  }
  
  
}

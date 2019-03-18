//
//  APIManager.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {

    class func apiGet(serviceName:String,parameters:String, completionHandler: @escaping (JSON?, NSError?) -> ()) {
        
     let postparam: String = String(describing:parameters).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
       
        var finalurl: String
      
  
        finalurl = "\(serviceName)\(postparam)"

        
        var request = URLRequest(url: URL(string:finalurl)!)
        request.httpMethod = "GET"
    
        request.httpBody = finalurl.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    
        Alamofire.request(request).responseJSON { response in

    switch response.result{
 
            case .success(_):
                if let data = response.result.value{
                    let json = JSON(data)
                    completionHandler(json,nil)
                }
                break
                
            case .failure(_):
                completionHandler(nil,response.result.error as NSError?)
                break
                
            }
        }
    }
    class func apiPost(serviceName:String,parameters:String, completionHandler: @escaping (JSON?, NSError?) -> ()) {
     
        let postparam: String = String(describing:parameters).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
     
        var finalurl: String
        finalurl = "\(serviceName)\(postparam)"
        
        
        var request = URLRequest(url: URL(string:finalurl)!)
        request.httpMethod = "POST"
        
        request.httpBody = finalurl.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in

            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    let json = JSON(data)
                    completionHandler(json,nil)
                }
                break
                
            case .failure(_):
                completionHandler(nil,response.result.error as NSError?)
                break
                
            }
        }
    }
    
    
}

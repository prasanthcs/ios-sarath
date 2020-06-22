//
//  APIManager.swift
//  Mvvm Test Project
//
//  Created by FairCode on 07/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import Foundation
import Alamofire

class APIManager: NSObject {
    
    static func getMethodWithHeader(URl : String, callback : @escaping((_ Result : AnyObject)-> Void)){
        Alamofire.request(Config.baseUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.response?.statusCode {
                case 200:
                    let JSON = response.result.value
                    callback(JSON as AnyObject)
                default:
                    callback("failed" as AnyObject)
                }
        }
    }
}

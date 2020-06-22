//
//  Datagenerator.swift
//  Mvvmtest
//
//  Created by user on 06/06/20.
//  Copyright © 2020 user. All rights reserved.

import Foundation

class DataGenerator {
    
    // MARK: - login api call
    static func news(completionBlock : @escaping ((_ result : AnyObject)-> Void)){
        let url = Config.baseUrl
        APIManager.getMethodWithHeader(URl: url, callback: {(results : AnyObject)-> Void in
            completionBlock(results)
        })
    }
}

//
//  NewsListTableViewControllerViewModel.swift
//  PineTech Test
//
//  Created by FairCode on 11/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import Foundation

protocol newsData {
    func data(newsData: NewsModel)
}

class NewsListTableViewControllerViewModel {
    
    var newsModel : NewsModel!
    var newsDelegate : newsData!
    
    func newsListApiCall() {
        DataGenerator.news(completionBlock: {(results : AnyObject)-> Void in
            self.configureNewsDataModel(data: results)
        })
    }
    
    private func configureNewsDataModel(data: AnyObject) {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data) else { return  }
        let resultData = try! JSONDecoder().decode(NewsModel.self, from: jsonData)
        newsModel = resultData
        configureLoginData()
    }
    private func configureLoginData() {
        if newsModel.status == "ok"{
            newsDelegate.data(newsData: newsModel)
        }else {
            print("mkmklmk")
        }
    }
}

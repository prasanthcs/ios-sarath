//
//  DetailsViewController.swift
//  PineTech Test
//
//  Created by FairCode on 11/06/20.
//  Copyright © 2020 FairCode. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webViewNewsDetails: WKWebView!
    
    var newsDetailsUrl = String()
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        activityIndicator.isHidden = true

        view.addSubview(activityIndicator)
        webViewNewsDetails.navigationDelegate = self
        webViewNewsDetails.load(NSURLRequest(url: NSURL(string: newsDetailsUrl)! as URL) as URLRequest)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Sriracha Sauce on 8/6/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate{
    var webView: WKWebView!
    
    override func loadView(){
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        let url = NSURL(string: "https://​www.google.com")!
        let urlRequest = NSURLRequest(URL: url)
        webView!.loadRequest(urlRequest)
        view.addSubview(webView)
        print("loadView called...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Webview loaded...")
    }
}


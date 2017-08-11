//
//  WB_OuathViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class WB_OuathViewController: UIViewController ,UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_AppKey)&redirect_uri=\(WB_Redirct_Url)"
        guard let url = URL.init(string: urlString) else {
            return
        }
        webView.loadRequest(URLRequest.init(url: url))
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let urlString = request.url?.absoluteString
        STLog(message: urlString)
        
        
        return  true
    }
    
}

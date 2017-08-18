//
//  WB_OuathViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
import SwiftyJSON


class WB_OuathViewController: UIViewController {

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
}

extension WB_OuathViewController : UIWebViewDelegate{
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        guard  let urlString = request.url?.absoluteString else {
            return false
        }
        if !urlString.hasPrefix(WB_Redirct_Url){
            STLog(message: "不是授权回掉页面")
            return true
        }
        STLog(message: "是授权回掉页面")
        let query = request.url?.query // 可以获得参数
        let code = query?.components(separatedBy: "=").last
        getAccessToken(code: code)
        
        return  false
    }
    
    func getAccessToken(code : String?){
        guard let codeString = code  else {
            return
        }
        let para = ["client_id":WB_AppKey,
                    "client_secret":WB_AppSecreat,
                    "grant_type":"authorization_code",
                    "code":codeString,
                    "redirect_uri":WB_Redirct_Url]
        
        WB_NetWorkTools.shareInstance.post(WB_GetAccess_token, parameters: para, progress: { (progerss: Progress) in
            
        }, success: { (task: URLSessionDataTask, objec : Any?) in
            
            let sjond = JSON.init(objec )
            let dict = sjond.dictionaryObject! as NSDictionary
            let userAccount = UserAccount.deserialize(from: dict)
            userAccount?.loadUserInfo(completion: { (userAccount , error ) in
                if userAccount == nil {
                    return
                }
                userAccount.saveUserAccount()
                self.dismiss(animated: true, completion: {
                    
                })
            })
            
        }) { (task: URLSessionDataTask?, error : Error) in
            
        }
    }
    
}


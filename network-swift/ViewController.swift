//
//  ViewController.swift
//  network-swift
//
//  Created by zhouyu on 2018/5/17.
//  Copyright © 2018年 zhouyu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let urlStr = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request("", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { (responseData) in
            
        }
        
        
        
        request(urlStr).response { (responseData) in
            DLog(responseData)
            if let error = responseData.error {
                DLog("请求出错")
            }else{
                let statusCode = responseData.response?.statusCode
                if statusCode == 200{
                    
                }else{
                    
                }
            }
            
            
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




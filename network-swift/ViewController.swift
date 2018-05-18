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
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Http<LocationModel>().url(url: "/svc/books/v3/lists/overview.json").sendRequest()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




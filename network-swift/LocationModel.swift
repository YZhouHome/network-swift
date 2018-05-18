//
//  LocationModel.swift
//  network-swift
//
//  Created by zhouyu on 2018/5/18.
//  Copyright © 2018年 zhouyu. All rights reserved.
//

import UIKit
import ObjectMapper
class LocationModel: Mappable {
    var district: String?
    var city: String?
    var desc: String?
    var ret: Int?
    var isp: String?
    var end: Int?
    var start: Int?
    var type: String?
    var province: String?
    var country: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
         district <- map["district"]
         city <- map["city"]
         desc <- map["desc"]
         ret <- map["ret"]
         isp <- map["isp"]
         end <- map["end"]
         start <- map["start"]
         type <- map["type"]
         province <- map["province"]
         country <- map["country"]
        
    }
}

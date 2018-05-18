//
//  Http.swift
//  network-swift
//
//  Created by zhouyu on 2018/5/18.
//  Copyright © 2018年 zhouyu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
let baseUrl = "http://api.nytimes.com"
let key = "39f40589088242f89595aefb1bfce2c6"
class Http<ModelClass: Mappable> {
    var url: String?
    var params: [String:AnyObject]?
    var requestObj: DataRequest?
    
    enum Methed: Int {
        case httpGet
        case httpPost
    }
    
    func url(url: String) -> Http{
        self.url = baseUrl + url
        return self
    }
    
    func params(params:[String:AnyObject]) -> Http {
        self.params = params
        return self
    }
    
    func sendRequest(methed: Methed = .httpGet) -> Http {
        if let requestUrl = url {
            var requestMethod: HTTPMethod = .get
            if methed == Methed.httpPost {
                requestMethod = .post
            }
            if params == nil{
                params = [:]
            }
            params!["api-key"] = key as AnyObject
            requestObj = request(requestUrl, method: requestMethod, parameters: params, encoding: URLEncoding.default, headers: nil).response { (responseData) in
                if let error = responseData.error {
                    //请求错误
                    DLog(error)
                }else{
                    let statusCode = responseData.response?.statusCode
                    if statusCode == 200{
                        if responseData.data != nil{
                            let json = try? JSON(data: responseData.data!)
                            guard let jsonStr = json?.rawString() else{
                                //解析错误
                                return
                            }
                            DLog(jsonStr)
                            //成功
                            if jsonStr.first == "{" {
                                let model = ModelClass(JSONString: jsonStr)
                            }else if jsonStr.first == "[" {
                                let models = Mapper<ModelClass>().mapArray(JSONString: jsonStr)
                            }else{
                                
                            }
                        }else{
                           //相应数据为空
                        }
                    }else{
                        //其他错误
                    }
                }
            }
        }
        return self
    }
    
    func cancelRequest() -> Http {
        requestObj?.cancel()
        return self
    }
    
}

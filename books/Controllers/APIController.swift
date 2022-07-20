//
//  APIController.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import Foundation
import Alamofire

public class APIController
{
    fileprivate func request(type: HTTPMethod, url: String, parameters: [String:Any?]?, headers: HTTPHeaders? = nil, completion: @escaping(_ success: Bool, _ error: String?, _ data: Any?) -> Void) {
            var newParams = [String:Any]()
            if let parameters = parameters {
                for (key, value) in parameters {
                    if value != nil {
                        newParams[key] = value!
                    } else {
                        newParams[key] = NSNull()
                    }
                }
            }
            

            print("Preparing request to: \(url)\n With parameterse: \(newParams)")
            
            AF.request(url, method: type, parameters: newParams, encoding: URLEncoding.default, headers: headers ).responseJSON { (response) in
                guard let statusCode = response.response?.statusCode else {
                    completion(false, "Unknown Error", nil)
                    return
                }
                var data:Any? = (response.value as? [String:Any])
                
                if data == nil {
                    data = response.value as? [[String:Any]]
                }
                print("Made request: Status Code = \(statusCode). Data=\(String(describing: data))")

                if let data = data, let error = (data as? [String:Any])?["error"] as? String {
                    completion(false, error, data)
                    return
                }
                completion(statusCode == 200, nil, data)
            }
        }
    
    func makeRequest(type: HTTPMethod, url: String, parameters: [String:Any?]?, completion: @escaping(_ success: Bool, _ error: String?, _ data: Any?) -> Void) {
 
            request(type: type, url: url, parameters: parameters, headers: nil, completion: completion)
        }
}

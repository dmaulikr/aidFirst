//
//  DataManager.swift
//  AidFirst
//
//  Created by student on 5/29/17.
//  Copyright © 2017 Arminas. All rights reserved.
//

import Foundation

class DataManager{
    
    var parsedData = [[String:Any]]()
    
    let url = "http://127.0.0.1:3000/api/getHospital"
    var completionHandler : (Data?, URLResponse?, Error?) -> Void { return
        {
            (data, response, error) in
            if let error = error {
                print(error)
            } else {
                do {
                    self.parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
                    print(self.parsedData)
                    
                } catch let error as NSError {
                    print(error)
                }
            }

        }
    }

    
    func sendHospitalRequest(url: String, parameters:[String:String], completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        
        let parameterString = parameters.stringFromHttpParameters()
        let requestURL = URL(string: "\(url)?\(parameterString)")!
        var request = URLRequest(url: requestURL)
        print(requestURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
        return task
    }
    
//    func parseData(data: [[String:Any]]) -> [[String:Any]] {
//        
//        var output = [[String:Any]]()
//        
//        let ids = data["id"] as? [[String: Any]] {
//            for id in ids {
//                if let hospital
//            }
//        }
//        
//        return output
//    }
    
}

extension String {
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}

extension Dictionary {
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
    
        return parameterArray.joined(separator: "&")
}
}


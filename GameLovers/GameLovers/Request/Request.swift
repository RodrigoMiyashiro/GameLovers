//
//  Request.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import Alamofire

class Request//: RequestProtocol
{
    static func getFrom(url: String, header: [String : String]?, completion: @escaping (Result<Any>) -> Void)
    {
        Alamofire.request(url, headers: header)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                print("📥 GET: \(response.request?.url?.absoluteString ?? "")")
                
                switch response.result
                {
                case .success:
                    completion(.success(response.data!))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}

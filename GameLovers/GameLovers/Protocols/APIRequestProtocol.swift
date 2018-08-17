//
//  APIRequestProtocol.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol APIRequestProtocol
{
    func get(withURL url: String, completion: @escaping (Result<Any>) -> Void)
}



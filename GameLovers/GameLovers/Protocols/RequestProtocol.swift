//
//  RequestProtocol.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol RequestProtocol
{
    func getFrom(url: String, header: [String: String]?, completion: @escaping (Result<Any>) -> Void)
}

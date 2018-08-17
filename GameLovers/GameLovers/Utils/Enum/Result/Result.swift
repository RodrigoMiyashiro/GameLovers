//
//  Result.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

enum Result<Value>
{
    case success(Value)
    case failure(Error)
}

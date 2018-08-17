//
//  PlatformInteget.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class PlatformInteger: NSObject
{
    var id: Int
    
    init(dataJSON: JSON)
    {
        id = dataJSON["id"].intValue
    }
}

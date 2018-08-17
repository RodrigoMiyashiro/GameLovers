//
//  Platform.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Platform
{
    var id: Int
    var name: String
    var games: ListInteger
    
    init(dataJSON: JSON)
    {
        id = dataJSON["id"].intValue
        name = dataJSON["name"].stringValue
        games = ListInteger(dataJSON: dataJSON["games"])
    }
    
    
}

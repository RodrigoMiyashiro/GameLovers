//
//  Game.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Game
{
    var id: Int
    var name: String
    var image: Cover
    
    init()
    {
        id = 0
        name = ""
        image = Cover()
    }
    
    init(dataJSON: JSON)
    {
        id = dataJSON["id"].intValue
        name = dataJSON["name"].stringValue
        image = Cover(dataJSON: dataJSON["cover"])
    }
}

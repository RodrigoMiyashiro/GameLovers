//
//  GameComplete.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class GameComplete
{
    var game: Game
    var genreInteger: ListInteger
    var avaiablePlatformsInteger: ListInteger
    var summary: String
    
    init(dataJSON: JSON)
    {
        game = Game(dataJSON: dataJSON)
        genreInteger = ListInteger(dataJSON: dataJSON["genres"])
        avaiablePlatformsInteger = ListInteger(dataJSON: dataJSON["platforms"])
        summary = dataJSON["summary"].stringValue
    }
}

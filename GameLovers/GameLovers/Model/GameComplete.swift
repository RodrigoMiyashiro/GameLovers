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
    
    init()
    {
        game = Game()
        genreInteger = ListInteger()
        avaiablePlatformsInteger = ListInteger()
        summary = ""
    }
    
    convenience init(dataJSON: JSON)
    {
        self.init()
        
        guard let dataJSON = dataJSON.arrayValue.first else { return }
        game = Game(dataJSON: dataJSON)
        genreInteger = ListInteger(dataJSON: dataJSON["genres"])
        avaiablePlatformsInteger = ListInteger(dataJSON: dataJSON["platforms"])
        summary = dataJSON["summary"].stringValue
    }
}

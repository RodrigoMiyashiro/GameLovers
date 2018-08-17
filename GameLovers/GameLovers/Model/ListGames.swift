//
//  ListGames.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListGames: NSObject, ListControlProtocol
{
    var games: [Game]
    
    override init()
    {
        games = [Game]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        parseJSON(arrayJSON: dataJSON.arrayValue)
    }
    
    func parseJSON(arrayJSON: [JSON])
    {
        for element in arrayJSON
        {
            let newGame = Game(dataJSON: element)
            games.append(newGame)
        }
    }
}

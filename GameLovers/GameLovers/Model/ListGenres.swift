//
//  ListGenres.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListGenres: NSObject, ListControlProtocol
{
    var genres: [Genre]
    
    override init()
    {
        genres = [Genre]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        parseJSON(arrayJSON: dataJSON["genres"].arrayValue)
    }
    
    func parseJSON(arrayJSON: [JSON])
    {
        for element in arrayJSON
        {
            let newGenre = Genre(dataJSON: element)
            genres.append(newGenre)
        }
    }
}

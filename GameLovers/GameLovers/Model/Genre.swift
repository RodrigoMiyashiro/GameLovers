//
//  Genre.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genre
{
    var id: Int
    var name: String
    
    init(dataJSON: JSON)
    {
        id = dataJSON["id"].intValue
        name = dataJSON["name"].stringValue
    }
}

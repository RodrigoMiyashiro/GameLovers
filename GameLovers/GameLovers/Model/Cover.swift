//
//  Cover.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cover
{
    var url: String
    var cloudinaryID: String
    var width: Int
    var height: Int
    
    init()
    {
        url = ""
        cloudinaryID = ""
        width = 0
        height = 0
    }
    
    init(dataJSON: JSON)
    {
        url = dataJSON["url"].stringValue
        cloudinaryID = dataJSON["cloudinary_id"].stringValue
        width = dataJSON["width"].intValue
        height = dataJSON["height"].intValue
    }
}

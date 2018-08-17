//
//  ListPlatform.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPlatform: NSObject, ListControlProtocol
{
    var platforms: [Platform]
    
    override init()
    {
        platforms = [Platform]()
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
            let newPlatform = Platform(dataJSON: element)
            platforms.append(newPlatform)
        }
    }
    
    func stringPlatforms() -> String
    {
        return platforms.map{ "\($0.name)" }.joined(separator: ", ")
    }
}

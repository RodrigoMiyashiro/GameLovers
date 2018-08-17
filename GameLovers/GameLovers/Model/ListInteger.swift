//
//  ListInteger.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListInteger: NSObject, ListControlProtocol
{
    var ids: [Int]
    
    
    override init()
    {
        ids = [Int]()
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
            let newInteger = element.intValue
            ids.append(newInteger)
        }
    }
}

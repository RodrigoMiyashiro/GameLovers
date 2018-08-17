//
//  File.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListPlatformInteger: NSObject, ListControlProtocol
{
    var listID: [PlatformInteger]
    
    
    override init()
    {
        listID = [PlatformInteger]()
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
            let newPlatformInteger = PlatformInteger(dataJSON: element)
            listID.append(newPlatformInteger)
        }
    }
    
    func getListPlatformsID() -> String
    {
        let arrayInteger = listID.map{ $0.id }
        return arrayInteger.convertArrayToString
    }
}

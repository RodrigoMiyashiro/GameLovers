//
//  String.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

extension Array
{
    var convertArrayToString: String
    {
        return self.map{ "\($0)" }.joined(separator: ",")
    }
    
    func getStrFromArray(toPosition position: Int) -> String
    {
        var lastPosition = position + 20
        if !self.indices.contains(lastPosition)
        {
            lastPosition = self.count
        }
        
        let newArray = Array(self[position..<(lastPosition)])
        return newArray.convertArrayToString
    }
}

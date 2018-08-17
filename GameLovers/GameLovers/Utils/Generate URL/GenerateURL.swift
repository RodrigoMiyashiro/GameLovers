//
//  GenerateURL.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class GenerateURL
{
    static func get(type: TypeURL, string: String? = nil) -> String
    {
        var url: String
        
        switch type
        {
        case .platforms: //https://api-endpoint.igdb.com/platforms/15,9,11,12
            url = "\(BaseURL.url.rawValue)\(ExtensionURL.platforms.rawValue)\(string ?? "")"
        
        case .gameSimple: //https://api-endpoint.igdb.com/games/487?fields=name,cover
            url = "\(BaseURL.url.rawValue)\(ExtensionURL.games.rawValue)\(string ?? "")\(ParameterURL.questionMark.rawValue)\(ParameterURL.fields.rawValue)\(ParameterURL.name.rawValue)\(ParameterURL.comma.rawValue)\(ParameterURL.cover.rawValue)"
            
        case .gameComplete: //https://api-endpoint.igdb.com/games/487
            url = "\(BaseURL.url.rawValue)\(ExtensionURL.games.rawValue)\(string ?? "")"
            
        case .genre: //https://api-endpoint.igdb.com/genres/31?fields=name
            url = "\(BaseURL.url.rawValue)\(ExtensionURL.genres.rawValue)\(string ?? "")\(ParameterURL.questionMark.rawValue)\(ParameterURL.fields.rawValue)\(ParameterURL.name.rawValue)"
            
        case .imageThumb:
            url = "\(BaseURL.urlImage.rawValue)\(ExtensionURL.igdb.rawValue)\(ExtensionURL.image.rawValue)\(ExtensionURL.upload.rawValue)\(ExtensionURL.thumb.rawValue)\(string ?? "").jpg"
            
        case .imageDetail:
            url = "\(BaseURL.urlImage.rawValue)\(ExtensionURL.igdb.rawValue)\(ExtensionURL.image.rawValue)\(ExtensionURL.upload.rawValue)\(ExtensionURL.imgBig.rawValue)\(string ?? "").jpg"
        }
        
        return url
    }
}

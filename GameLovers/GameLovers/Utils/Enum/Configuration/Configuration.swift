//
//  Header.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

enum Header
{
    static let params = ["user-key" : "36b684370a750913eb522168bc166c24", "Accept" : "application/json"]
}

enum BaseURL: String
{
    case url = "https://api-endpoint.igdb.com/"
    case urlImage = "https://images.igdb.com/"
}

enum ExtensionURL: String
{
    case platforms = "platforms/"
    case games = "games/"
    case genres = "genres/"
    case igdb = "igdb/"
    case image = "image/"
    case upload = "upload/"
    case thumb = "t_thumb/"
    case imgBig = "t_cover_big/"
}

enum ParameterURL: String
{
    case fields = "fields="
    case name = "name"
    case games = "games"
    case cover = "cover"
    
    case bar = "/"
    case questionMark = "?"
    case concat = "&"
    case comma = ","
}

enum TypeURL: String
{
//    case platformsIDs
    case platforms
    case genre
    case gameSimple
    case gameComplete
    case imageThumb
    case imageDetail
}

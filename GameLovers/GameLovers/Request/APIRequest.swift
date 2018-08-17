//
//  APIRequest.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIRequest: APIRequestProtocol
{
    func get(withURL url: String, completion: @escaping (Result<Any>) -> Void)
    {
        Request.getFrom(url: url, header: Header.params) { (result) in
            switch result
            {
            case .success(let data):
                print("🧐 Success!!!")
                completion(.success(data))
                
            case .failure(let error):
                print("🧐 Error..")
                completion(.failure(error))
            }
        }
    }
}


extension APIRequest//: APIRequestListPlatformIntegerProtocol
{
    static func getListPlatformInteger(completion: @escaping (Result<ListPlatformInteger>) -> Void)
    {
        let url = GenerateURL.get(type: .platforms)
        
        Request.getFrom(url: url, header: Header.params) { result in
            switch result
            {
            case .success(let data):
                let listPlatform = ListPlatformInteger(dataJSON: JSON(data))
                print("🧐 [List Platform Integer] Success!!!")
                completion(.success(listPlatform))
                
            case .failure(let error):
                print("🧐 [List Platform Integer] Error..")
                completion(.failure(error))
            }
        }
    }
}

extension APIRequest//: APIRequestListPlatformProtocol
{
    static func getListPlatform(withString string: String, completion: @escaping (Result<ListPlatform>) -> Void)
    {
        let url = GenerateURL.get(type: .platforms, string: string)
        
        Request.getFrom(url: url, header: Header.params) { result in
            switch result
            {
            case .success(let data):
                let listPlatform = ListPlatform(dataJSON: JSON(data))
                print("🧐 [List Platforms] Success!!!")
                completion(.success(listPlatform))
                
            case .failure(let error):
                print("🧐 [List Platforms] Error..")
                completion(.failure(error))
            }
        }
    }
}

extension APIRequest//: APIRequestListGameSimpleProtocol
{
    static func getListGamesSimple(withString string: String, completion: @escaping (Result<ListGames>) -> Void)
    {
        let url = GenerateURL.get(type: .gameSimple, string: string)
        
        Request.getFrom(url: url, header: Header.params) { result in
            switch result
            {
            case .success(let data):
                let listGames = ListGames(dataJSON: JSON(data))
                print("🧐 [List Games Simple] Success!!!")
                completion(.success(listGames))
                
            case .failure(let error):
                print("🧐 [List Games Simple] Error..")
                completion(.failure(error))
            }
        }
    }
}

extension APIRequest//: APIRequestGameCompleteProtocol
{
    static func getGameComplete(withString string: String, completion: @escaping (Result<GameComplete>) -> Void)
    {
        let url = GenerateURL.get(type: .gameComplete, string: string)
        
        Request.getFrom(url: url, header: Header.params) { result in
            switch result
            {
            case .success(let data):
                let game = GameComplete(dataJSON: JSON(data))
                print("🧐 [Game Complete] Success!!!")
                completion(.success(game))
                
            case .failure(let error):
                print("🧐 [Game Complete] Error..")
                completion(.failure(error))
            }
        }
    }
}

extension APIRequest//: APIRequestListGenreProtocol
{
    static func getListGenres(withString string: String, completion: @escaping (Result<ListGenres>) -> Void)
    {
        let url = GenerateURL.get(type: .genre, string: string)
        
        Request.getFrom(url: url, header: Header.params) { result in
            switch result
            {
            case .success(let data):
                let listGenres = ListGenres(dataJSON: JSON(data))
                print("🧐 [List Genre] Success!!!")
                completion(.success(listGenres))
                
            case .failure(let error):
                print("🧐 [List Genre] Error..")
                completion(.failure(error))
            }
        }
    }
}

//
//  APIRequestProtocol.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 15/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol APIRequestProtocol
{
    func get(withURL url: String, completion: @escaping (Result<Any>) -> Void)
}


protocol APIRequestListPlatformIntegerProtocol
{
    func get(completion: @escaping (Result<ListPlatformInteger>) -> Void)
}

protocol APIRequestListPlatformProtocol
{
    func get(withString string: String, completion: @escaping (Result<ListPlatform>) -> Void)
}

protocol APIRequestListGameSimpleProtocol
{
    func get(withString string: String, completion: @escaping (Result<ListGames>) -> Void)
}

protocol APIRequestGameCompleteProtocol
{
    func get(withString string: String, completion: @escaping (Result<GameComplete>) -> Void)
}

protocol APIRequestListGenreProtocol
{
    func get(withString string: String, completion: @escaping (Result<ListGenres>) -> Void)
}


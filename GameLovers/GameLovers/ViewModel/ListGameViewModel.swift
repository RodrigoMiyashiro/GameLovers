//
//  ListGameViewModel.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol ListGameViewModelProtocol
{
    var stringInteger: String? { get set }
    var listGames: ListGames? { get }
    var listGamesDidChange: ((ListGameViewModelProtocol) -> Void)? { get set }
    
    init()
    func getListGames(completion: @escaping (Error) -> Void)
}

class ListGameViewModel: ListGameViewModelProtocol
{
    var stringInteger: String?
    
    var listGames: ListGames?
    {
        didSet
        {
            self.listGamesDidChange?(self)
        }
    }
    
    var listGamesDidChange: ((ListGameViewModelProtocol) -> Void)?
    
    required init()
    {
        
    }
}


extension ListGameViewModel
{
    func getListGames(completion: @escaping (Error) -> Void)
    {
        APIRequest.getListGamesSimple(withString: stringInteger ?? "") { (result) in
            switch result
            {
            case .success(let list):
                if self.listGames == nil
                {
                    self.listGames = list
                }
                else
                {
                    let oldList = self.listGames
                    oldList?.games += list.games
                    self.listGames = oldList
                }
                
            case .failure(let error):
                completion(error)
            }
        }
    }
}

//
//  GameCompleteViewModel.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol GameCompleteViewModelProtocol
{
    var gameComplete: GameComplete? { get }
    var gameCompleteDidChange: ((GameCompleteViewModelProtocol) -> Void)? { get set }
    
    init()
    func getGameComplete(completion: @escaping (Error) -> Void)
}

class GameCompleteViewModel: GameCompleteViewModelProtocol
{
    var gameComplete: GameComplete?
    {
        didSet
        {
            self.gameCompleteDidChange?(self)
        }
    }
    
    var gameCompleteDidChange: ((GameCompleteViewModelProtocol) -> Void)?
    
    required init()
    {
        
    }
}


extension GameCompleteViewModel
{
    func getGameComplete(completion: @escaping (Error) -> Void)
    {
        APIRequest.getGameComplete(withString: "") { (result) in
            switch result
            {
            case .success(let game):
                self.gameComplete = game
                
            case .failure(let error):
                completion(error)
            }
        }
    }
}

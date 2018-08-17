//
//  ListGenresViewModel.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol ListGenresViewModelProtocol
{
    var listGenres: ListGenres? { get }
    var listGenresDidChange: ((ListGenresViewModelProtocol) -> Void)? { get set }
    
    init()
    func getListGernes(completion: @escaping (Error) -> Void)
}

class ListGenresViewModel: ListGenresViewModelProtocol
{
    var listGenres: ListGenres?
    {
        didSet
        {
            self.listGenresDidChange?(self)
        }
    }
    
    var listGenresDidChange: ((ListGenresViewModelProtocol) -> Void)?
    
    required init()
    {
        
    }
}

extension ListGenresViewModel
{
    func getListGernes(completion: @escaping (Error) -> Void)
    {
        APIRequest.getListGenres(withString: "") { (result) in
            switch result
            {
            case .success(let list):
                self.listGenres = list
                
            case .failure(let error):
                completion(error)
            }
        }
    }
}

//
//  PlatformsIdViewModel.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol PlatformIntegerViewModelProtocol: class
{
    var platforms: ListPlatformInteger? { get }
    var platformsDidChange: ((PlatformIntegerViewModelProtocol) -> Void)? { get set }
    
    init()
    func getListPlatformInteger(success: @escaping (ListPlatformInteger) -> Void, failure: @escaping (Error) -> Void)
}


class PlatformIntegerViewModel: PlatformIntegerViewModelProtocol
{    
    var platforms: ListPlatformInteger?
    {
        didSet
        {
            self.platformsDidChange?(self)
        }
    }
    
    var platformsDidChange: ((PlatformIntegerViewModelProtocol) -> Void)?
    
    
    required init()
    {
        
    }
}

extension PlatformIntegerViewModel
{    
    func getListPlatformInteger(success: @escaping (ListPlatformInteger) -> Void, failure: @escaping (Error) -> Void) {
        APIRequest.getListPlatformInteger { (result) in
            switch result
            {
            case .success(let list):
                success(list)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
}

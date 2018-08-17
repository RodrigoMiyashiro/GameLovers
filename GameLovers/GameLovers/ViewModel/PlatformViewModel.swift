//
//  PlatformViewModel.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

protocol PlatformViewModelProtocol: class
{
    var platforms: ListPlatform? { get }
//    var stringInteger: String? { get set }
    var platformsDidChange: ((PlatformViewModelProtocol) -> Void)? { get set }
    
    init()
    func requestAllPlatforms(completion: @escaping (Error?) -> Void)
    func getListPlatform(withPlatformsID listIDs: String?, completion: @escaping(Error?) -> Void)
}


class PlatformViewModel: PlatformViewModelProtocol
{
//    var stringInteger: String?
    
    var platformIntegerList: PlatformIntegerViewModelProtocol?
    
    var platforms: ListPlatform?
    {
        didSet
        {
            print("🕵️‍♂️ List Plaforms")
            self.platformsDidChange?(self)
        }
    }
    
    var platformsDidChange: ((PlatformViewModelProtocol) -> Void)?
    
    
    required init()
    {
        
    }
}


extension PlatformViewModel
{
    func requestAllPlatforms(completion: @escaping (Error?) -> Void)
    {
        self.platformIntegerList = PlatformIntegerViewModel()
        self.platformIntegerList?.getListPlatformInteger(success: { (listPlatformInteger) in
            self.getListPlatform(withPlatformsID: listPlatformInteger.getListPlatformsID(), completion: { (error) in
                print("🧐 Error get List Platform \(String(describing: error))")
            })
        }, failure: { (error) in
            print("🧐 Error get List Platform Integer \(error)")
            completion(error)
        })
    }
    
    func getListPlatform(withPlatformsID listIDs: String?, completion: @escaping(Error?) -> Void)
    {        
        APIRequest.getListPlatform(withString: listIDs ?? "") { (result) in
            switch result
            {
            case .success(let list):
                self.platforms = list
                
            case .failure(let error):
                completion(error)
            }
        }
    }
}

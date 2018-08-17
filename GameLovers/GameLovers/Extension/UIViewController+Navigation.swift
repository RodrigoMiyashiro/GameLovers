//
//  UIViewController+Navigation.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController
{
    func getStoryboardWithViewController(destination: DestinationView, storyboardName: StoryboardName, value: Any? = nil) -> UIViewController
    {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        var viewController: UIViewController
        
        switch destination
        {
        case .listGames:
            viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerIdentifier.listGame.rawValue) //as! ListGamesViewController
        }
        
        return viewController
    }
    
    
    func navigationTransitionTo(_ destination: DestinationView, storyboardName: StoryboardName, destinationValue: Any? = nil)
    {
        let openView = getStoryboardWithViewController(destination: destination, storyboardName: storyboardName, value: destinationValue)
        var navigationType: NavigationType
        
        switch destination
        {
//        case .listGames:
//
//            navigationType = .navigationController
//            
//        case .:
//            navigationType = .presentFade
            
        default:
            navigationType = .present
        }
        
        setNavigationType(navigationType, viewController: openView)
    }
    
    
    func setNavigationType(_ navigationType: NavigationType, viewController: UIViewController)
    {
        switch navigationType
        {
        case .navigationController:
            navigationController?.pushViewController(viewController, animated: true)
            
        case .present:
            self.present(viewController, animated: true, completion: nil)
            
        case .presentFade:
            viewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            present(viewController, animated: true, completion: nil)
        }
    }
}

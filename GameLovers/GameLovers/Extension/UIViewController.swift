//
//  UIViewController.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 17/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController
{
    func set(title: String)
    {
        self.title = title
    }
    
    func arrayViewController(typeViewController type: DestinationView, andNumberOfElement number: Int) -> [UIViewController]
    {
        var listVC = [UIViewController]()
        for _ in 0..<number
        {
            let viewController = self.getStoryboardWithViewController(destination: type, storyboardName: .main)
            listVC.append(viewController)
        }
        
        return listVC
    }
}

//
//  GameCollectionViewCell.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell
{
    // MARK: - Var
    var game: Game?
    {
        didSet
        {
            if let game = game
            {
                set(name: game.name)
                load(strImage: game.image.cloudinaryID)
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var nameGameLabel: UILabel!
    
    
    
    // MARK: - Awake
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        configCell()
    }
    
    
    // MARK: - Configurations
    func configCell()
    {
        self.border(withColor: .lightGray, andWidth: 1)
    }
    
    
    func set(name: String)
    {
        nameGameLabel.text = name
    }
    
    func load(strImage: String)
    {
        let url = GenerateURL.get(type: .imageThumb, string: strImage)
        gameImage.download(image: url, placeholder: Placeholder.image.rawValue)
    }
    
}

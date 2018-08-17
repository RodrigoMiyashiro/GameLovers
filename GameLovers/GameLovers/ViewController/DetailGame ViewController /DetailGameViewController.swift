//
//  DetailGameViewController.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

final class DetailGameViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var game: Game?
    var gameCompleteViewModel: GameCompleteViewModelProtocol?
    {
        didSet
        {
            gameCompleteViewModel?.gameCompleteDidChange = { [weak self] viewModel in
                self?.requestGenres(ids: viewModel.gameComplete?.genreInteger.ids.convertArrayToString ?? "")
                self?.requestPlatforms(ids: viewModel.gameComplete?.avaiablePlatformsInteger.ids.convertArrayToString ?? "")
                self?.config(game: viewModel)
                Spinner.shared.stopAnimating()
            }
        }
    }
    
    var genresViewModel: ListGenresViewModelProtocol?
    {
        didSet
        {
            genresViewModel?.listGenresDidChange = { [weak self] viewModel in
                self?.set(genres: viewModel.listGenres?.stringGenres())
            }
        }
    }
    
    var platformsViewModel: PlatformViewModelProtocol?
    {
        didSet
        {
            platformsViewModel?.platformsDidChange = { [weak self] viewModel in
                self?.set(platforms: viewModel.platforms?.stringPlatforms())
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var nameGameLabel: UILabel!
    @IBOutlet weak var genreGameLabel: UILabel!
    @IBOutlet weak var platformsGameLabel: UILabel!
    @IBOutlet weak var summaryGameLabel: UILabel!
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        gameCompleteViewModel = GameCompleteViewModel()
        genresViewModel = ListGenresViewModel()
        platformsViewModel = PlatformViewModel()
        
        requestGame()
    }
    
    
    // MARK: - Configurations
    func config(game: GameCompleteViewModelProtocol)
    {
        config(imageString: game.gameComplete?.game.image.cloudinaryID ?? "")
        set(name: game.gameComplete?.game.name)
        set(summary: game.gameComplete?.summary)
    }
    
    func config(imageString: String)
    {
        let urlImg = GenerateURL.get(type: .imageDetail, string: imageString)
        
        gameImage.download(image: urlImg, placeholder: Placeholder.image.rawValue)
    }
    
    
    func set(name: String?)
    {
        nameGameLabel.text = name
    }
    
    func set(summary: String?)
    {
        summaryGameLabel.text = summary
    }
    
    func set(genres: String?)
    {
        genreGameLabel.text = "Genres: \(genres ?? "")"
    }
    
    func set(platforms: String?)
    {
        platformsGameLabel.text = "Platforms: \(platforms ?? "")"
    }
    
    
    // MARK: - Requests
    func requestGame()
    {
        Spinner.shared.show(view: self.view)
        
        gameCompleteViewModel?.stringID = String(game?.id ?? 0)
        gameCompleteViewModel?.getGameComplete(completion: { (error) in
            Spinner.shared.stopAnimating()
            self.setNavigationType(.present, viewController: Alert.show(message: error.localizedDescription))
        })
    }
    
    func requestGenres(ids: String)
    {
        genresViewModel?.getListGernes(withGenresID: ids, completion: { (error) in
            self.setNavigationType(.present, viewController: Alert.show(message: error?.localizedDescription))
        })
    }
    
    func requestPlatforms(ids: String)
    {
        platformsViewModel?.getListPlatform(withPlatformsID: ids, completion: { (error) in
            self.setNavigationType(.present, viewController: Alert.show(message: error?.localizedDescription))
        })
    }

}

//
//  ListGamesViewController.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

final class ListGamesViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var platform: Platform?
    var listGamesViewModel: ListGameViewModelProtocol?
    {
        didSet
        {
            listGamesViewModel?.listGamesDidChange = { [weak self] viewModel in
                
                self?.listGameCollectionView.reloadData()
            }
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var listGameCollectionView: UICollectionView!
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        listGamesViewModel = ListGameViewModel()
        
        print("🕵️‍♂️ ?? \(platform?.name) ??")
        
        requestListGames(numberOfElementsCurrent: listGamesViewModel?.listGames?.games.count ?? 0)
        infinityScroll()
    }
    
    
    // MARK: - Request
    func infinityScroll()
    {
        listGameCollectionView.addInfiniteScroll { (collectionView) in
            let numberOfItemsPlatform = self.platform?.games.ids.count ?? 0
            let numberOfItemsGames = self.listGamesViewModel?.listGames?.games.count ?? 0
            
            if numberOfItemsPlatform != numberOfItemsGames
            {
                self.requestListGames(numberOfElementsCurrent: numberOfItemsGames)
            }
            
            collectionView.finishInfiniteScroll()
        }
        
    }
    
    func requestListGames(numberOfElementsCurrent: Int)
    {
        listGamesViewModel?.stringInteger = platform?.games.ids.getStrFromArray(toPosition: numberOfElementsCurrent)
        print("🧐 List: \(listGamesViewModel?.stringInteger)")
        
        listGamesViewModel?.getListGames(completion: { (error) in
            self.setNavigationType(.present, viewController: Alert.show(message: error.localizedDescription))
        })
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Segue.gameDetail.rawValue
        {
            let vcDestination = segue.destination as! DetailGameViewController
            
            if let game = sender as? Game
            {
                vcDestination.game = game
            }
        }
    }
    
    
}


// MARK: - Extension CollectionView DataSource
extension ListGamesViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return listGamesViewModel?.listGames?.games.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = listGameCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.gameCollectionCell.rawValue, for: indexPath) as! GameCollectionViewCell
        
        let item = indexPath.item
        let game = listGamesViewModel?.listGames?.games[item]
        cell.game = game
        
        return cell
    }
}


// MARK: - Extension CollectionView Delegate
extension ListGamesViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let itemSelected = indexPath.item
        let gameSelected = listGamesViewModel?.listGames?.games[itemSelected]
        
        performSegue(withIdentifier: Segue.gameDetail.rawValue, sender: gameSelected)
    }
}


// MARK: - Extension CollectionView DelegateFlowLayout
extension ListGamesViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = self.view.frame.size.width / 2.2
        let height = self.view.frame.size.height / 2.5
        
        return CGSize(width: width, height: height)
    }
}

//
//  HomeViewController.swift
//  GameLovers
//
//  Created by Rodrigo Miyashiro on 16/08/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import Parchment

class HomeViewController: CustomViewController
{
    // MARK: - Lets and Vars
    var pagingViewController: PagingViewController<PagingIndexItem>!
    lazy var pages: [UIViewController] = {
       return self.arrayViewController(typeViewController: .listGames, andNumberOfElement: listPlatforms?.platforms?.platforms.count ?? 0)
    }()
    
    var listPlatforms: PlatformViewModelProtocol?
    {
        didSet
        {
            listPlatforms?.platformsDidChange = { [weak self] viewModel in
                self?.pagingViewController.reloadData()
                self?.configPages()
                Spinner.shared.stopAnimating()
            }
        }
    }
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentView: UIView!
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.set(title: "Game Lovers App")
        
        listPlatforms = PlatformViewModel()
        
        configPageViewController()
        
        requestPlatforms()
    }
    
    
    // MARK: - Configuration
    private func configPageViewController()
    {
        pagingViewController = PagingViewController<PagingIndexItem>()
        pagingViewController.dataSource = self
        pagingViewController.delegate = self
        pagingViewController.indicatorColor = .navigationTint
        pagingViewController.textColor = .lightGray
        pagingViewController.selectedTextColor = .black
        pagingViewController.menuItemSize = .fixed(width: self.view.frame.width/2.5, height: 50)
        
        addChildViewController(pagingViewController)
        contentView.addSubview(pagingViewController.view)
        contentView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)
        
    }
    
    private func configPages()
    {
        let numberOfPlatforms = listPlatforms?.platforms?.platforms.count ?? 0
        for position in 0..<numberOfPlatforms
        {
            (pages[position] as! ListGamesViewController).platform = listPlatforms?.platforms?.platforms[position]
        }
    }
    
    
    // MARK: - Request
    func requestPlatforms()
    {
        Spinner.shared.show(view: self.view)
        listPlatforms?.requestAllPlatforms(completion: { (error) in
            Spinner.shared.stopAnimating()
            self.setNavigationType(.present, viewController: Alert.show(message: error?.localizedDescription))
        })
    }
}


extension HomeViewController: PagingViewControllerDataSource
{
    func numberOfViewControllers<T>(in pagingViewController: PagingViewController<T>) -> Int
    {
        return listPlatforms?.platforms?.platforms.count ?? 0
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T
    {
        let platform = listPlatforms?.platforms?.platforms[index]
        return PagingIndexItem(index: index, title: platform?.name ?? "E ai?") as! T
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController
    {
        return pages[index]
    }
}

extension HomeViewController: PagingViewControllerDelegate
{
    
}

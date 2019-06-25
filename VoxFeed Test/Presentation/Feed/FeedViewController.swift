//
//  FeedViewController.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit
import AlamofireImage

class FeedViewController: ViewController<FeedView> {
    
    let presenter: FeedPresenter!
    
    let cellId = "PostCell"
    
    var posts = [PostViewModel]()
    
    private let cellTemplate = PostCell()
    
    let downloader = ImageDownloader()
    
    init(withPresenter presenter: FeedPresenter) {
        self.presenter = presenter
        
        super.init()
        controllerView = FeedView()
        
        edgesForExtendedLayout = [UIRectEdge.top]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        handlePresenterStates()
        
        presenter.fetchPosts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        controllerView.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setupCollectionView() {
        let collectionView = controllerView.collectionView
        
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: 360)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }
    
    private func handlePresenterStates() {
        _ = presenter.feedStateObservable.subscribe(onNext: { state in
    
            switch state {
            case .fetching:
                break
            case .fetched(let postViewModels):
                self.posts = postViewModels
                self.controllerView.collectionView.reloadData()
            case .errorDownloading:
                break
            }
            
        })
    }
}


extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let topInset: CGFloat = 20
        // VC's view has a Y relative to its super viewcontroller
        let topBarOffset = self.view.frame.minY
        let notchInset: CGFloat = (Utils.phoneHasNotch() ? 24 : 0)
        let botFreeSpace: CGFloat = 50
        let botInset = topBarOffset + topInset + notchInset + botFreeSpace
        
        return UIEdgeInsets(top: topInset, left: 0, bottom: botInset, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellTemplate.item = posts[indexPath.row]
        return cellTemplate.sizeThatFits(CGSize(width: collectionView.bounds.width, height: .greatestFiniteMagnitude))
    }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostCell
        
        let post = posts[indexPath.row]
        cell.item = post
        
        if cell.postImage.image == nil {
            cell.downloadPostImage(post) {
                UIView.animate(withDuration: 0.3, animations: {
                    collectionView.collectionViewLayout.invalidateLayout()
                    collectionView.collectionViewLayout.prepare()
                })
            }
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

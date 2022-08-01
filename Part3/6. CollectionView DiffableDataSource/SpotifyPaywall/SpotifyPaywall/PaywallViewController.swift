//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by 김진웅 on 2022/08/01.
//

import UIKit

class PaywallViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
      
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerInfos: [BannerInfo] = BannerInfo.list
    
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    enum Section {
        case main
    }
    typealias Item = BannerInfo
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentation : diffable datasource
        datasource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(item)
            cell.backgroundColor = self.colors[indexPath.item]
            return cell
        })
        
        // data : snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos, toSection: .main)
        datasource.apply(snapshot)
        
        
        // layout : compositional layout
        collectionView.collectionViewLayout = layout()
        
        //horizontal에서 위아래로 움직일 수 있는 것을 막는다.
        collectionView.alwaysBounceVertical = false
        
        pageControl.numberOfPages = bannerInfos.count
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // 섹션에서 페이징을 할 때 페이지가 가운데에 위치하도록 하는 코드
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            
            // offset의 x 값을 현재 container의 너비로 나눈다.
            //.rounded(.up) 반올림
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            self.pageControl.currentPage = index
            
        }
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

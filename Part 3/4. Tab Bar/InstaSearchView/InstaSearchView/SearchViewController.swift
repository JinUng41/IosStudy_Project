//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by 김진웅 on 2022/07/30.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // Data, Presentation, Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowlayout.estimatedItemSize = .zero
        }
        
        self.navigationItem.title = "Search" // 네비게이션 바의 title
        let searchController = UISearchController(searchResultsController: nil) // UISearchController - 검색하는 searchview를 만들어 준다.
        searchController.hidesNavigationBarDuringPresentation = false // 검색하는 동안 네비게이션에 가리지 않도록
        searchController.searchBar.placeholder = "Search" 
        searchController.searchResultsUpdater = self // 현재 collectionView를 의미
        self.navigationItem.searchController = searchController
    }
    
    
    
    
}

extension SearchViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
    
    
}

// sizeForItemAt - 셀의 사이즈를 정할 때
extension SearchViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing:CGFloat = 1
        let width = (collectionView.bounds.width - interItemSpacing * 2 ) / 3
        let height = width
        return CGSize(width: width,height: height)
    }
    
    
    // minimumInteritemSpacingForSectionAt - 셀 간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // minimumLineSpacingForSectionAt - 행 간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

// 네비게이션 프로토콜에 따른 메소드, UISearchResultsUpdating의 updateSearchResults
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search : \(search)")
    }
    
    
}

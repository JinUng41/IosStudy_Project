//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 김진웅 on 2022/07/28.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList : [StockModel]=StockModel.list // Data
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    // Data - 어떤 데이터? -> stockList
    // Presentation - 셀을 어떻게 표현?
    // Layout - 셀을 어떻게 배치?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self // Presentation
        collectionView.delegate = self // Presentation
        
    }
}

extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}

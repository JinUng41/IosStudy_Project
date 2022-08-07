//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 김진웅 on 2022/07/28.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    // uicomponent 연결
    // uicomponet에 데이터를 업데이트하는 코드를 넣자
    
    @IBOutlet weak var rankLabel: UILabel! // 순위
    @IBOutlet weak var companyIconImageView: UIImageView! // 회사 아이콘
    @IBOutlet weak var companyNameLabel: UILabel! // 회사 이름
    @IBOutlet weak var companyPriceLabel: UILabel! // 주식 가격
    @IBOutlet weak var diffLabel: UILabel! // 등락율
    
    func configure(_ stock: StockModel){
        rankLabel.text="\(stock.rank)"
        companyIconImageView.image=UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
        /*
        let color : UIColor
        if stock.diff > 0 {
            color = UIColor.systemRed
        }
        else {
            color = UIColor.systemBlue
        }
        diffLabel.textColor = color
         */
        // diffLabel.textColor = 조건 ? true 일 때 : false 일 때
        diffLabel.textColor = stock.diff>0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    
    func convertToCurrencyFormat(price : Int)->String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value:price)) ?? ""
        return result
    }
    
}

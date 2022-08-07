//
//  FeedCell.swift
//  InstaSearchView
//
//  Created by 김진웅 on 2022/07/30.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String){
        thumbnailImageView.image = UIImage(named: imageName)
    }
}

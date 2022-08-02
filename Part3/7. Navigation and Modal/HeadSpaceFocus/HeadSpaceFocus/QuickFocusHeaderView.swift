//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 김진웅 on 2022/08/02.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title:String) {
        titleLabel.text = title
    }
}

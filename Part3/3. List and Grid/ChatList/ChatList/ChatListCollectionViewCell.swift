//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 김진웅 on 2022/07/29.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // dequeueReusableCell로 재사용하는 셀을 스토리보드로 가져올 때 가장 먼저 호출되는 함수
    // 프로젝트에서는 셀을 가져올 때 먼저 이 함수에서 thumbnail을 둥근 사각형 모양으로 만들게끔 해준다.
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateStrinig(dateString: chat.date)
    }
    
    // 날짜 형태 변환 함수
    func formattedDateStrinig(dateString: String) -> String {
        // String -> Date 타입 -> String
        // 2022-04-01 -> 4/1
        let formatter = DateFormatter() // DateFormatter 객체 이용
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 문자열 -> date 타입
        if let date = formatter.date(from: dateString) {
            
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
            
        } else {
            
            return ""
        }
    }
}

//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 김진웅 on 2022/07/29.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Data, Presentation, Layout
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // chatList를 오름차순으로 정렬 (14줄 코드를 let이 아닌 var로 설정)
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
    }
    

}
// datasource 프로토콜을 준수하기 위한 코드
extension ChatListViewController: UICollectionViewDataSource {
    // collectionView에 표현되는 아이템의 개수 알려주는 코드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count // chatList의 count 되는 개수만큼
    }
    // 셀을 어떻게 표현할지 결정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // collectionView에서 셀을 재사용하기 때문에 재사용 구분자를 통해 셀을 가져오는 코드
        // 캐스팅이 안될 수도 있어 옵셔널하게 ChatListCollectionViewCell로 캐스팅하여 셀의 정보를 가져옴
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
    
    
}

// layout
// collectionView의 여러가지 역할 중 layout에 대한 역할을 위임
// 싱글 컬럼이기 때문에 너비는 collectionView의 너비와 같게, 높이는 100
extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
// 이 때 collectionView의 estimate size 옵션을 NONE으로 바꿔줘야 명확한 셀 사이즈 전달이 가능하다.


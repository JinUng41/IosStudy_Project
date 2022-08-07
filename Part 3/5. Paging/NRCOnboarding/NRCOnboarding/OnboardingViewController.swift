//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 김진웅 on 2022/08/01.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        // messages의 수만큼 pageControl 개수 지정
        pageControl.numberOfPages = messages.count
        
    }
    


}
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
        
    }
    
    
}

extension OnboardingViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 셀과 collectionView의 사이즈가 같기 때문
        return collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

// 페이지와 페이지 컨트롤 동기화하기
// collectionView는 ScrollView의 속성을 가지고 있다.
// 따라서 UIScrollViewDelegate를 이용하여 현재 스크롤 되고 있는 상황을 파악할 수 있다.
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // x축의 값을 너비로 나누어서 Int형으로 index에 저장 index = 0, 1, 2,....
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        pageControl.currentPage = index
    }
    
}

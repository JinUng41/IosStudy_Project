//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by 김진웅 on 2022/08/02.
//

import UIKit
import Combine
// 앱에서 사파리를 띄우고 싶을 때, SafariServices를 import 해줘야 한다.
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //@Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    var subscriptions = Set<AnyCancellable>()
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unknown", imageName: "", urlString: "", description: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        // input : 버튼 클릭
        // framework -> url -> safari -> present
        
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap{URL(string: $0.urlString)}
            .sink { url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        // output : Data 세팅 될때 UI 업데이트
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
        
    }

    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }

}

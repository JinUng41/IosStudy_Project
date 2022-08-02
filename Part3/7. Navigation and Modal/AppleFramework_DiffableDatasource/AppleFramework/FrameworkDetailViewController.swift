//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by 김진웅 on 2022/08/02.
//

import UIKit
// 앱에서 사파리를 띄우고 싶을 때, SafariServices를 import 해줘야 한다.
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    func updateUI() {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
    

    @IBAction func learnMoreTapped(_ sender: Any) {
        // 옵셔널이기 때문에 guard let 문으로 감싼다.
        guard let url = URL(string: framework.urlString) else {
            return
        }
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
        
    }
    

}

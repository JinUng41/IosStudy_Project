//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by 김진웅 on 2022/07/24.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols:[String]=["sun.min","moon","cloud","wind","snowflake"]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
        button.tintColor=UIColor.systemPink
        
        //ToDo :
        // - 심볼에서, 하나를 임의로 추출해서,
        // - 이미지와 텍트로 설정을 한다.
        // DRY = Do not Repeat Yourself
        
        /*let symbol = symbols.randomElement()!
        
        imageView.image=UIImage(systemName: symbol)
        label.text=symbol*/
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func reload() {
        let symbol = symbols.randomElement()!
        
        imageView.image=UIImage(systemName: symbol)
        label.text=symbol
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        /*let symbol = symbols.randomElement()!
        
        imageView.image=UIImage(systemName: symbol)
        label.text=symbol*/
        reload()
    }
    

}

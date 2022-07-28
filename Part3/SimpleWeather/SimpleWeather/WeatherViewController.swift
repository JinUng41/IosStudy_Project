//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by 김진웅 on 2022/07/28.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var temperatuerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    let cities = ["Seoul","Tokyo","LA","Seattle"]
    let weathers = ["cloud.fill","sun.max.fill","wind","cloud.sun.rain.fill"]
    
    @IBAction func changeButton(_ sender: Any) { // 버튼이 눌렸을 때
        cityLabel.text=cities.randomElement()
        let imageName = weathers.randomElement()!
        let randomTemp = Int.random(in: 10..<30)
        temperatuerLabel.text="\(randomTemp)°"
        weatherImageView.image=UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal) // 원래의 색깔을 표현하기 위해서..(이렇게 사용하면 tint color 적용안됨)
    }
    

}

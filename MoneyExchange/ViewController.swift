//
//  ViewController.swift
//  MoneyExchange
//
//  Created by Oscar Rossello on 30/10/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coins: [Coin] = []
    var currCoin: Int = 0 {
        didSet {
            setCoin(coin: coins[currCoin])
        }
    }
    // Coin attributes
    @IBOutlet weak var coinBackground: UIImageView!
    @IBOutlet weak var coinFlag: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    
    // Nav buttons
    @IBOutlet weak var lblPrevious: UIButton!
    @IBOutlet weak var lblNext: UIButton!
    @IBAction func btnPrevious(_ sender: UIButton) {
        
    }
    @IBAction func btnNext(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill coins array
        coins = [
            Coin.init(name: "Euro", flag: UIImage(named: "flag_eu")!, background: UIImage(named: "background_eu")!),
            Coin.init(name: "Dollar", flag: UIImage(named: "flag_us")!, background: UIImage(named: "background_us")!),
            Coin.init(name: "Pound", flag: UIImage(named: "flag_gb")!, background: UIImage(named: "background_gb")!)
        ]
        
        currCoin = 0
    }
    
    func setCoin(coin: Coin) {
        coinName.text = coin.getName()
        coinFlag.image = coin.getFlag()
        coinBackground.image = coin.getBackground()
    }
}

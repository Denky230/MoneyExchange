//
//  ViewController.swift
//  MoneyExchange
//
//  Created by Oscar Rossello on 30/10/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    // Coins
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
    @IBOutlet weak var coinValue: UILabel!
    
    // Nav buttons
    @IBOutlet weak var lblPrevious: UIButton!
    @IBOutlet weak var lblNext: UIButton!
    @IBAction func btnPrevious(_ sender: UIButton) {
        if currCoin == 0 {
            currCoin = coins.count - 1
        } else {
            currCoin -= 1
        }
    }
    @IBAction func btnNext(_ sender: UIButton) {
        if currCoin == coins.count - 1 {
            currCoin = 0
        } else {
            currCoin += 1
        }
    }
    
    // Covertion vars
    @IBOutlet weak var lblConvertValue: UILabel!
    @IBAction func btnConvert(_ sender: UIButton) {
//        lblConvertValue.text =
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill coins array
        coins = [
            Coin.init(name: "Euro", value: 10, flag: UIImage(named: "flag_eu")!, background: UIImage(named: "background_eu")!),
            Coin.init(name: "Dollar", value: 20, flag: UIImage(named: "flag_us")!, background: UIImage(named: "background_us")!),
            Coin.init(name: "Pound", value: 15, flag: UIImage(named: "flag_gb")!, background: UIImage(named: "background_gb")!)
        ]
        currCoin = 0
        
    }
    
    func setCoin(coin: Coin) {
        coinName.text = coin.getName()
        coinValue.text = String(coin.getValue()) + "€"
        coinFlag.image = coin.getFlag()
        coinBackground.image = coin.getBackground()
    }
}

//
//  ViewController.swift
//  MoneyExchange
//
//  Created by Oscar Rossello on 30/10/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    @IBOutlet weak var inputTextMoney: UITextField!
    @IBOutlet weak var lblConvertValue: UILabel!
    @IBAction func btnConvert(_ sender: UIButton) {
        lblConvertValue.text = "\(inputTextMoney.text!) \(firstCoin!.getName())s equals to\n \(secondCoin!.getName())s"
    }
    
    // PickerView
    @IBOutlet weak var pickerView: UIPickerView!
    var firstCoin, secondCoin: Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fill coins array
        coins = [
            Coin.init(name: "Euro", value: 10, flag: UIImage(named: "flag_eu")!, background: UIImage(named: "background_eu")!),
            Coin.init(name: "Dollar", value: 20, flag: UIImage(named: "flag_us")!, background: UIImage(named: "background_us")!),
            Coin.init(name: "Pound", value: 15, flag: UIImage(named: "flag_gb")!, background: UIImage(named: "background_gb")!)
        ]
        currCoin = 0
        
        initPickerView()
    }
    
    func setCoin(coin: Coin) {
        coinName.text = coin.getName()
        coinValue.text = String(coin.getValue()) + "€"
        coinFlag.image = coin.getFlag()
        coinBackground.image = coin.getBackground()
    }
    
    func initMoneyInputText() {
        inputTextMoney.delegate = self
        inputTextMoney.keyboardType = .numberPad
    }
    
    func initPickerView() {
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        firstCoin = coins[0]
        secondCoin = coins[0]
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coins[row].getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 1) {
            firstCoin = coins[row]
        } else {
            secondCoin = coins[row]
        }
    }
}

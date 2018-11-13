//
//  ViewController.swift
//  MoneyExchange
//
//  Created by Oscar Rossello on 30/10/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager: CoinManager = CoinManager()
    
    var currCoin: Int = 0 {
        didSet {
            setCoinElements(coin: coins[currCoin])
        }
    }
    // Coin attributes
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinValue: UILabel!
    @IBOutlet weak var coinFlag: UIImageView!
    @IBOutlet weak var coinBackground: UIImageView!
    
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
    
    // Coversion
    let HACK_CODE: Int = 666
    @IBOutlet weak var inputTextMoney: UITextField!
    @IBOutlet weak var lblConvertValue: UILabel!
    @IBAction func btnConvert(_ sender: UIButton) {
        // Make sure inputMoneyText is not nil
        if let money = Double(inputTextMoney.text!) {
            // Check if hack code was input
            if (Int(money) == HACK_CODE) {
                // Get HackViewController from Storyboard
                let hackVC: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HackVC") as UIViewController
                // Jump to HackViewController
                present(hackVC, animated: false, completion: nil)
            } else {
                // Money conversion
                let conversionRatio = Double(coinPicker.coinComponents[0].getValue()) / Double(coinPicker.coinComponents[1].getValue())
                let conversionResult = money / conversionRatio
                lblConvertValue.text = "\(money) \(coinPicker.coinComponents[0].getName())s equals to\n \(conversionResult) \(coinPicker.coinComponents[1].getName())s"
            }
        }
    }
    
    // PickerView
    var coinPicker: CoinPicker = CoinPicker()
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.initCoinsArray()
        initPickerView()
        initMoneyInputText()
        currCoin = 0
    }
    
    func setCoinElements(coin: Coin) {
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
        pickerView.delegate = coinPicker
        coinPicker.initialize(numComponents: 2)
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(
            withDuration: 4.0,
            delay: 0.1,
            options: .curveEaseOut,
            animations: { toastLabel.alpha = 0.0 },
            completion: { (isCompleted) in toastLabel.removeFromSuperview() }
        )
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Make text field only accept numbers
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
}

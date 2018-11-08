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
    let coinNames: [String] = [
        "Euro", "Dollar", "Pound"
    ]
    let coinValues: [Int] = [
        10, 20, 15
    ]
    let coinFlags: [UIImage] = [
        UIImage(named: "flag_eu")!,
        UIImage(named: "flag_us")!,
        UIImage(named: "flag_gb")!
    ]
    let coinBackgrounds: [UIImage] = [
        UIImage(named: "background_eu")!,
        UIImage(named: "background_us")!,
        UIImage(named: "background_gb")!
    ]
    var currCoin: Int = 0 {
        didSet {
            setCoinElements(coin: coins[currCoin])
        }
    }
    var firstCoin, secondCoin: Coin?
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
    
    // Coversion vars
    @IBOutlet weak var inputTextMoney: UITextField!
    @IBOutlet weak var lblConvertValue: UILabel!
    @IBAction func btnConvert(_ sender: UIButton) {
        if let money = Double(inputTextMoney.text!) {
            let convertRatio = Double(firstCoin!.getValue()) / Double(secondCoin!.getValue())
            let convertedResult = money / convertRatio
            lblConvertValue.text = "\(money) \(firstCoin!.getName())s equals to\n \(convertedResult) \(secondCoin!.getName())s"
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCoinsArray()
        initPickerView()
        initMoneyInputText()
    }
    
    func setCoinElements(coin: Coin) {
        coinName.text = coin.getName()
        coinValue.text = String(coin.getValue()) + "€"
        coinFlag.image = coin.getFlag()
        coinBackground.image = coin.getBackground()
    }
    
    func initCoinsArray() {
        for i in 0...coinNames.count {
            coins.append(Coin.init(
                    name: coinNames[i],
                    value: coinValues[i],
                    flag: coinFlags[i],
                    background: coinBackgrounds[i]
            ))
        }
        currCoin = 0
    }
    func initMoneyInputText() {
        inputTextMoney.delegate = self
        inputTextMoney.keyboardType = .numberPad
    }
    func initPickerView() {
        pickerView.delegate = self
        firstCoin = coins[0]
        secondCoin = coins[0]
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
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
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

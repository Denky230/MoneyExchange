//
//  Coin.swift
//  MoneyExchange
//
//  Created by Oscar Rossello on 30/10/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import Foundation
import UIKit

class Coin {
    private var name: String
    private var value: Double
    private var flag: UIImage
    private var background: UIImage
    
    init(name: String, value: Double, flag: UIImage, background: UIImage) {
        self.name = name
        self.value = value
        self.flag = flag
        self.background = background
    }
    init() {
        self.name = String()
        self.value = Double()
        self.flag = UIImage()
        self.background = UIImage()
    }
    
    func getName() -> String {
        return self.name
    }
    func setName(newName: String) {
        name = newName
    }
    
    func getValue() -> Double {
        return self.value
    }
    func setValue(newValue: Double) {
        value = newValue
    }
    
    func getFlag() -> UIImage {
        return self.flag
    }
    func setFlag(newFlag: UIImage) {
        flag = newFlag
    }
    
    func getBackground() -> UIImage {
        return self.background
    }
    func setBackground(newBackground: UIImage) {
        background = newBackground
    }
}

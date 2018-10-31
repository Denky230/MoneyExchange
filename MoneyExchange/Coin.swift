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
    private var value: Int
    private var flag: UIImage
    private var background: UIImage
    
    init(name: String, value: Int, flag: UIImage, background: UIImage) {
        self.name = name
        self.value = value
        self.flag = flag
        self.background = background
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    func getFlag() -> UIImage {
        return self.flag
    }
    
    func getBackground() -> UIImage {
        return self.background
    }
}

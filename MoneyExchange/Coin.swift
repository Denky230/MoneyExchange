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
    private var flag: UIImage
    private var background: UIImage
    
    init(name: String, flag: UIImage, background: UIImage) {
        self.name = name
        self.flag = flag
        self.background = background
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getFlag() -> UIImage {
        return self.flag
    }
    
    func getBackground() -> UIImage {
        return self.background
    }
}

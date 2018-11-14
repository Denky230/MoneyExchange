//
//  CoinManager.swift
//  MoneyExchange
//
//  Created by dmorenoar on 13/11/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import Foundation
import UIKit

var coins: [Coin] = []

class CoinManager {
    
    init() { initCoinsArray() }
    
    // Coin fields
    let coinNames: [String] = [
        "Euro", "Dollar", "Pound"
    ]
    let coinValues: [Double] = [
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
    
    func initCoinsArray() {
        coins.removeAll()
        for i in 0 ..< coinNames.count {
            coins.append(Coin.init(
                name: coinNames[i],
                value: coinValues[i],
                flag: coinFlags[i],
                background: coinBackgrounds[i]
            ))
        }
    }
}

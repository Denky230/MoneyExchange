//
//  NumericTextField.swift
//  MoneyExchange
//
//  Created by Oscar Rossello on 13/11/2018.
//  Copyright © 2018 Oscar Rossello. All rights reserved.
//

import UIKit

class NumberNaturalTextField: UITextField, UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Make text field only accept numbers
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
}

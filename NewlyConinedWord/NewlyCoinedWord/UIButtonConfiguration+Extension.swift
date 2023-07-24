//
//  UIButtonConfiguration+Extension.swift
//  NewlyConinedWord
//
//  Created by JongHoon on 2023/07/21.
//

import UIKit

extension UIButton.Configuration {
        
    static func newlyCoinnedWordStyle(title: String? = nil) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = .small
        configuration.background.strokeColor = .black
        configuration.background.strokeWidth = 1.0
        configuration.title = title
         
        return configuration
    }
}

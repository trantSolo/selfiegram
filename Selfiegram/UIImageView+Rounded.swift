//
//  UIImageView+Rounded.swift
//  Selfiegram
//
//  Created by Trant Solo on 10.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func maskAsRounded() {
        layer.cornerRadius = layer.frame.width / 2
        layer.masksToBounds = true
    }
    
}

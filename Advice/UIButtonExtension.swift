//
//  UIButtonExtension.swift
//  Frend`s Advice
//
//  Created by Артем on 11/12/2018.
//  Copyright © 2018 Gukov.space. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func rotate() {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = 0
        rotate.toValue = Float.pi
        rotate.duration = 0.2
        layer.add(rotate, forKey: nil)
    }
}

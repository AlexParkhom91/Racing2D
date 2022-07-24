//
//  Extentions shadow.swift
//  RaseGame
//
//  Created by Александр Пархамович on 19.07.22.
//

import Foundation
import UIKit

extension ViewController{
func creatNewButton(xBtn: Int, yBtn: Int, backgroundColor: UIColor, buttonTitle: String) -> UIButton {
    
    let newButton = UIButton()
    
    newButton.frame = CGRect(x: xBtn, y: yBtn, width: 150, height: 60)
    newButton.backgroundColor = backgroundColor
    newButton.clipsToBounds = true
    newButton.layer.cornerRadius = newButton.bounds.height / 2
    newButton.setTitle(buttonTitle, for: .normal)
    newButton.layer.masksToBounds = false
    newButton.layer.shadowColor = UIColor.systemRed.cgColor
    newButton.layer.shadowOpacity = 0.5
    newButton.layer.shadowRadius = newButton.bounds.height / 2
    
    return newButton
    
}
}

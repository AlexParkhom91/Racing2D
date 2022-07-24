//
//  SettingsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .systemCyan
        title = "Setting"
        
        let swipeBackToMainSqreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeBackSqreen))
        swipeBackToMainSqreen.direction = .right
        view.addGestureRecognizer(swipeBackToMainSqreen)

    }

    @objc func swipeBackSqreen() {
    
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}

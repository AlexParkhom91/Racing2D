//
//  RecordsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import Foundation
import UIKit

class RecordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .systemCyan
        title = "Records"
        
        let swipeBacktoMainScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeBackSqreen))
        swipeBacktoMainScreen.direction = .right
        view.addGestureRecognizer(swipeBacktoMainScreen)

    }
    
    @objc func swipeBackSqreen() {
    
        navigationController?.popToRootViewController(animated: true)
        
    }
}

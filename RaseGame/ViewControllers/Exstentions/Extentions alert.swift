//
//  Extentions alert.swift
//  RaseGame
//
//  Created by Александр Пархамович on 4.08.22.
//

import Foundation
import UIKit

extension ViewController{
    
    func alertNewUser() {
        let alertController = UIAlertController(title: "New Player Name: ", message: nil, preferredStyle: .alert)
        let alertSave = UIAlertAction(title: "Save", style: .cancel) { (action) in
            
            let tfText = alertController.textFields?.first
            guard let text = tfText?.text else { return }
            UserDefaults.standard.set(text, forKey: "name")
        
        }
        
        alertController.addTextField { tf in
            tf.placeholder = "Name New Player"
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(alertCancel)
        alertController.addAction(alertSave)
        present(alertController, animated: true)
        
    }
}

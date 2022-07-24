//
//  ViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import UIKit

class ViewController: UIViewController {
    var newGameBtn: UIButton = UIButton()
    var settingBtn: UIButton = UIButton()
    var recordsBtn: UIButton = UIButton()
    
    
     
    let widthBtn = 160
    let heightBtn = 80
    let xBtn = 0
    let yBtn = 0

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBlue
        
        // CREATE NEW GAME BUTTON
        
        let xNewGameBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yNewGameBtn = (Int(view.bounds.height) / 2) - heightBtn
        
        newGameBtn = creatNewButton(xBtn: xNewGameBtn, yBtn: yNewGameBtn, backgroundColor: .systemRed, buttonTitle: "New Game")
        newGameBtn.addTarget(self, action: #selector(showNewGameViewController), for: .touchUpInside )
        view.addSubview(newGameBtn)
       
       
        
        // CREATE SETTING BUTTON
        
        let xSettingBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let ySettingBtn = (Int(view.bounds.height) / 2)
        
        settingBtn = creatNewButton(xBtn: xSettingBtn, yBtn: ySettingBtn, backgroundColor: .systemRed, buttonTitle: "Setting")
        settingBtn.addTarget(self, action: #selector(showSettingViewController), for: .touchUpInside )
        view.addSubview(settingBtn)
        
        // CREATE RECORDS BUTTON
        
        let xRecordsBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yRecordsBtn = (Int(view.bounds.height) / 2) + heightBtn
        
        recordsBtn = creatNewButton(xBtn: xRecordsBtn, yBtn: yRecordsBtn, backgroundColor: .systemRed, buttonTitle: "Records")
        recordsBtn.addTarget(self, action: #selector(showRecordsViewController), for: .touchUpInside )
        view.addSubview(recordsBtn)
        
    }

    @objc func showNewGameViewController() {
        
        let viewController = NewGameViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @objc func showSettingViewController() {
        
        let viewController = SettingViewController()
        navigationController?.pushViewController(viewController, animated: true)
  
    }
    
    @objc func showRecordsViewController() {
        
        let viewController = RecordsViewController()
        navigationController?.pushViewController(viewController, animated: true)
  
    }
   
}








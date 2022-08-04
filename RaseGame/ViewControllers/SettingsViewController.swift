//
//  SettingsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
  
    let alertBtn = UIButton()
    let backgroundView = UIImageView()
    let selectCarLabel = UILabel()
    let carImageView = UIImageView()
    let nextImageCarBtn = UIButton()
    let backImageCarBtn = UIButton()
    let saveSettingBtn = UIButton()
    let arrayCarImage: [String] = ["Car", "Car1", "Car2", "Car3", "Car4"]
    var currentCarImage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupSelectCarLabel()
        setupImageView()
        setupNextImage()
        setupBackImage()
        setupSaveSettingBtn()
    }
    //MARK: - Setup Layout
    
    func setupLayout() {
        backgroundView.image = UIImage(named: "menu")
        backgroundView.frame = view.frame
        backgroundView.center = view.center
        view.addSubview(backgroundView)
        
    }
    //MARK: - Setup Select Car Label
    
    func setupSelectCarLabel(){
        selectCarLabel.translatesAutoresizingMaskIntoConstraints = false
        selectCarLabel.backgroundColor = .systemGreen
        selectCarLabel.layer.opacity = 0.75
        selectCarLabel.layer.cornerRadius = 20
        selectCarLabel.clipsToBounds = true
        selectCarLabel.text = "Select Car"
        selectCarLabel.textAlignment = .center
        selectCarLabel.font = .boldSystemFont(ofSize: 26)
        view.addSubview(selectCarLabel)
        
        NSLayoutConstraint.activate([
            selectCarLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            selectCarLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectCarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectCarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    //MARK: - saveSettings
    
    @objc func saveSettings() {
    
            let settings = Setting(car: arrayCarImage[currentCarImage])
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
        
        print("Save")
    }
    //MARK: - setupNextImage Btn
    
    func setupNextImage() {
        
        nextImageCarBtn.frame = CGRect(x: view.center.x + 10, y: view.frame.maxY - 150, width: 100, height: 50)
        nextImageCarBtn.backgroundColor = .blue
        nextImageCarBtn.setTitle("Next", for: .normal)
        nextImageCarBtn.addTarget(self, action: #selector(nextIndexCarImage), for: .touchUpInside)
        view.addSubview(nextImageCarBtn)
       
        
    }
    
    //MARK: - setupBackImage Btn
    
    func setupBackImage() {
        
        backImageCarBtn.frame = CGRect(x: view.center.x - 110, y: view.frame.maxY - 150, width: 100, height: 50)
        backImageCarBtn.backgroundColor = .blue
        backImageCarBtn.setTitle("Back", for: .normal)
        backImageCarBtn.addTarget(self, action: #selector(backIndexCarImage), for: .touchUpInside)
        view.addSubview(backImageCarBtn)
       
    }
    
    //MARK: - setupImageView
    
    func setupImageView(){
        carImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        carImageView.center = view.center
  
        view.addSubview(carImageView)
        carImage ()
    }
    //MARK: - setup SaveSettingBtn
    
    func setupSaveSettingBtn(){
        saveSettingBtn.frame = CGRect(x: view.center.x - 50, y: view.frame.maxY - 250 , width: 100, height: 50)
        saveSettingBtn.backgroundColor = .green
        saveSettingBtn.setTitle("Save", for: .normal)
        saveSettingBtn.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
        view.addSubview(saveSettingBtn)
        
    
        
    }
    
    //MARK: - setup Car Image
    
    func carImage () {
        let image = UIImage(named: arrayCarImage[currentCarImage])
        self.carImageView.image = image
    }
    //MARK: - setup nextIndexCarImage
    
  @objc func nextIndexCarImage() {
        if currentCarImage == arrayCarImage.count - 1 {
            currentCarImage = 0
         
          
        } else {
            currentCarImage += 1
        }
      carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    }
    
    //MARK: - setup backIndexCarImage
    
    @objc func backIndexCarImage() {
        if currentCarImage == 0 {
            currentCarImage = arrayCarImage.count - 1
            
          
        } else {
            currentCarImage -= 1
        }
        carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    }
}



 
 

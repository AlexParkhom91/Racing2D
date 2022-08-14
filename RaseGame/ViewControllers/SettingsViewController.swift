//
//  SettingsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    private let backgroundView = UIImageView()
    
    private let carImageView = UIImageView()
    private let nextImageCarBtn = UIButton()
    private let backImageCarBtn = UIButton()
    
    private let selectBarrierLabel = UILabel()
    private let barrierImageView = UIImageView()
    private let nextImageBarrierBtn = UIButton()
    private let backImageBarrierBtn = UIButton()
    
    private let normalSpeedBtn = UIButton()
    private let hardSpeedBtn = UIButton()
    
    private let saveSettingBtn = UIButton()
    
    let arrayCarImage: [String] = ["Car", "Car1", "Car2", "Car3", "Car4"]
    private let arrayBarrierImage: [String] = ["Stone","Cust"]
    private var currentCarImage = 0
    private var currentBarrierImage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setupSelectCarLabel()
        setupCarImageView()
        setupBackCarImage()
        setupNextCarImage()
        setupSelectBarrierLabel()
        setupBarrierImageView()
        setupBackBarrierImage()
        setupNextBarrierImage()
        selectSpeedGameLabel()
        setupNormalSpeed()
        setupHardSpeed()
        saveSettingsBtn()
        
    }
    
    //MARK: - Background View
    
    func setupBackgroundView(){
        backgroundView.image = UIImage(named: "Road")
        backgroundView.frame = view.frame
        view.addSubview(backgroundView)
        
    }
    
    //MARK: - Select Car Label
    
    func setupSelectCarLabel(){
        let selectCarLabel = newLabel(title: "Select Car")
        view.addSubview(selectCarLabel)
    
        NSLayoutConstraint.activate([
            selectCarLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            selectCarLabel.heightAnchor.constraint(equalToConstant: 50),
            selectCarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            selectCarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25)
            
        ])
        
    }
    
    //MARK: - Car Image View
    
    func setupCarImageView(){
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
        view.addSubview(carImageView)
       
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            carImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
            carImageView.widthAnchor.constraint(equalToConstant: 80),
            carImageView.heightAnchor.constraint(equalToConstant: 120)
            
        ])
    }
   
    //MARK: - Back Car Image Btn
    
    func setupBackCarImage() {
        backImageCarBtn.translatesAutoresizingMaskIntoConstraints = false
        backImageCarBtn.setImage(UIImage(named: "back"), for: .normal)
        backImageCarBtn.addTarget(self, action: #selector(backIndexCarImage), for: .touchUpInside)
        view.addSubview(backImageCarBtn)
        
        NSLayoutConstraint.activate([
            backImageCarBtn.widthAnchor.constraint(equalToConstant: 70),
            backImageCarBtn.heightAnchor.constraint(equalToConstant: 70),
            backImageCarBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backImageCarBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 170)
            
        ])
    }
    
    //MARK: - Back Index Car Image
    
    @objc func backIndexCarImage() {
        if currentCarImage == 0 {
            currentCarImage = arrayCarImage.count - 1
        } else {
            currentCarImage -= 1
        }
        carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    }
    
    //MARK: - Next Car Image Btn
    
    func setupNextCarImage() {
        nextImageCarBtn.translatesAutoresizingMaskIntoConstraints = false
        nextImageCarBtn.setImage(UIImage(named: "next"), for: .normal)
        nextImageCarBtn.addTarget(self, action: #selector(nextIndexCarImage), for: .touchUpInside)
        view.addSubview(nextImageCarBtn)
       
        NSLayoutConstraint.activate([
            nextImageCarBtn.widthAnchor.constraint(equalToConstant: 70),
            nextImageCarBtn.heightAnchor.constraint(equalToConstant: 70),
            nextImageCarBtn.leadingAnchor.constraint(equalTo: backImageCarBtn.trailingAnchor, constant: 15),
            nextImageCarBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 170)
            
        ])
    }
    
    //MARK: - Next Index Car Image
    
  @objc func nextIndexCarImage() {
        if currentCarImage == arrayCarImage.count - 1 {
            currentCarImage = 0
        } else {
            currentCarImage += 1
        }
      carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    }
    
    //MARK: - Select Barrier Label
    
    func setupSelectBarrierLabel(){
        let selectBarrierLabel = newLabel(title: "Select Barrier")
        view.addSubview(selectBarrierLabel)
        
        NSLayoutConstraint.activate([
            selectBarrierLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 280),
            selectBarrierLabel.heightAnchor.constraint(equalToConstant: 50),
            selectBarrierLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectBarrierLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    //MARK: - Barrier Image View
    
    func setupBarrierImageView(){
        barrierImageView.translatesAutoresizingMaskIntoConstraints = false
        barrierImageView.image = UIImage(named: arrayBarrierImage[currentBarrierImage])
        view.addSubview(barrierImageView)
       
        NSLayoutConstraint.activate([
            barrierImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            barrierImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
            barrierImageView.widthAnchor.constraint(equalToConstant: 70),
            barrierImageView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    //MARK: - Back Barrier Image Btn
    
    func setupBackBarrierImage() {
        backImageBarrierBtn.translatesAutoresizingMaskIntoConstraints = false
        backImageBarrierBtn.setImage(UIImage(named: "back"), for: .normal)
        backImageBarrierBtn.addTarget(self, action: #selector(backIndexBarrierImage), for: .touchUpInside)
        view.addSubview(backImageBarrierBtn)
        
        NSLayoutConstraint.activate([
            backImageBarrierBtn.widthAnchor.constraint(equalToConstant: 70),
            backImageBarrierBtn.heightAnchor.constraint(equalToConstant: 70),
            backImageBarrierBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backImageBarrierBtn.centerYAnchor.constraint(equalTo: barrierImageView.centerYAnchor)
            
        ])
    }
    
    //MARK: - Next Barrier Image Btn
    
    func setupNextBarrierImage() {
        nextImageBarrierBtn.translatesAutoresizingMaskIntoConstraints = false
        nextImageBarrierBtn.setImage(UIImage(named: "next"), for: .normal)
        nextImageBarrierBtn.addTarget(self, action: #selector(nextIndexBarrierImage), for: .touchUpInside)
        view.addSubview(nextImageBarrierBtn)
       
        NSLayoutConstraint.activate([
            nextImageBarrierBtn.widthAnchor.constraint(equalToConstant: 70),
            nextImageBarrierBtn.heightAnchor.constraint(equalToConstant: 70),
            nextImageBarrierBtn.leadingAnchor.constraint(equalTo: backImageBarrierBtn.trailingAnchor, constant: 15),
            nextImageBarrierBtn.centerYAnchor.constraint(equalTo: barrierImageView.centerYAnchor)
        ])

    }
    
    //MARK: - Next Index Barrier Image
    
  @objc func nextIndexBarrierImage() {
        if currentBarrierImage == arrayBarrierImage.count - 1 {
            currentBarrierImage = 0
        } else {
            currentBarrierImage += 1
        }
      barrierImageView.image = UIImage(named: arrayBarrierImage[currentBarrierImage])
    }
    
    //MARK: - Back Index Car Image
    
    @objc func backIndexBarrierImage() {
        if currentBarrierImage == 0 {
            currentBarrierImage = arrayBarrierImage.count - 1
        } else {
            currentBarrierImage -= 1
        }
        barrierImageView.image = UIImage(named: arrayBarrierImage[currentBarrierImage])
    }
    
    //MARK: - Selec Speed Game Label
    
    func selectSpeedGameLabel(){
        let speedLabel = newLabel(title: "Select Speed Game")
        view.addSubview(speedLabel)
        
        NSLayoutConstraint.activate([
            speedLabel.heightAnchor.constraint(equalToConstant: 50),
            speedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            speedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            speedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 430)
        ])
    }
    
    //MARK: - Normal Speed Btn
    
    func setupNormalSpeed(){
        normalSpeedBtn.translatesAutoresizingMaskIntoConstraints = false
        normalSpeedBtn.layer.cornerRadius = 20
        normalSpeedBtn.clipsToBounds = true
        normalSpeedBtn.setTitle("Normal", for: .normal)
        normalSpeedBtn.setTitleColor(.white, for: .normal)
        normalSpeedBtn.backgroundColor = .systemGray3
        normalSpeedBtn.addTarget(self, action: #selector(changeNormalSpeed), for: .touchUpInside)
        view.addSubview(normalSpeedBtn)
        
        NSLayoutConstraint.activate([
            normalSpeedBtn.heightAnchor.constraint(equalToConstant: 50),
            normalSpeedBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            normalSpeedBtn.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            normalSpeedBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 490)
            
        ])
    }
    
    @objc func changeNormalSpeed(){
        let speed = 2
        UserDefaults.standard.set(speed, forKey: "speed")
        
        normalSpeedBtn.backgroundColor = UIColor(named: "SystemBlue")
        hardSpeedBtn.backgroundColor = .systemGray3
        
    }
    
    //MARK: - Hard Speed Btn
    
    func setupHardSpeed(){
        hardSpeedBtn.translatesAutoresizingMaskIntoConstraints = false
        hardSpeedBtn.layer.cornerRadius = 20
        hardSpeedBtn.clipsToBounds = true
        hardSpeedBtn.setTitle("Hard", for: .normal)
        hardSpeedBtn.setTitleColor(.white, for: .normal)
        hardSpeedBtn.backgroundColor = .systemGray3
        hardSpeedBtn.addTarget(self, action: #selector(changeHardSpeed), for: .touchUpInside)
        view.addSubview(hardSpeedBtn)
        
        NSLayoutConstraint.activate([
            hardSpeedBtn.heightAnchor.constraint(equalToConstant: 50),
            hardSpeedBtn.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            hardSpeedBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hardSpeedBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 490)
        ])
    }
    
    @objc func changeHardSpeed(){
        let speed = 1
        UserDefaults.standard.set(speed, forKey: "speed")
        
        normalSpeedBtn.backgroundColor = .systemGray3
        hardSpeedBtn.backgroundColor = UIColor(named: "SystemBlue")
        
    }
   
    //MARK: - Save Settings Btn
    
    func saveSettingsBtn() {
        saveSettingBtn.translatesAutoresizingMaskIntoConstraints = false
        saveSettingBtn.layer.cornerRadius = 20
        saveSettingBtn.clipsToBounds = true
        saveSettingBtn.setTitle("Save Setting", for: .normal)
        saveSettingBtn.setTitleColor(.white, for: .normal)
        saveSettingBtn.backgroundColor = .systemGray3
        saveSettingBtn.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
        view.addSubview(saveSettingBtn)
        
        NSLayoutConstraint.activate([
            saveSettingBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            saveSettingBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveSettingBtn.widthAnchor.constraint(equalToConstant: 200),
            saveSettingBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - Save Settings func
    
    @objc func saveSettings() {
        let settings = Setting(car: arrayCarImage[currentCarImage] , barrier: arrayBarrierImage[currentBarrierImage])
            UserDefaults.standard.set(encodable: settings, forKey: "settings")
            saveSettingBtn.backgroundColor = UIColor(named: "SystemBlue")
            navigationController?.popToRootViewController(animated: true)
        
    }
}

//MARK: - Create New Element's

private extension SettingViewController {
    
    func newLabel(title: String) -> UILabel {
        let newLabel = UILabel()
        
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.text = title
        newLabel.textColor = .white
        newLabel.textAlignment = .center
        newLabel.font = .boldSystemFont(ofSize: 26)
        return newLabel
        
    }
}

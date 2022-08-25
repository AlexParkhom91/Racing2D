//
//  SettingsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
   
// MARK: - UI Element's
private let backgroundView = UIImageView()

private let selectCarLabel = UILabel()
private let carImageView = UIImageView()
private let nextImageCarBtn = UIButton()
private let backImageCarBtn = UIButton()

private let selectBarrierLabel = UILabel()
private let barrierImageView = UIImageView()
private let nextImageBarrierBtn = UIButton()
private let backImageBarrierBtn = UIButton()

private let selectSpeedLabel = UILabel()
private let speedPickerView = UIPickerView()

private let saveSettingBtn = UIButton()

// MARK: - Constants
let arrayCarImage: [String] = ["Car", "Car1", "Car2", "Car3", "Car4"]
private let arrayBarrierImage: [String] = ["Stone","Cust"]
private let arraySpeedGame = [["Easy","Normal","Hard"],["Normal"],["Hard"]]

// MARK: - Variables
private var currentCarImage = 0
private var currentBarrierImage = 0

// MARK: - View Did Load
override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewElements()
    setupLayout()
    setupAppearance()
    setupBechavior()
    
}

// MARK: - Setup View Elements
private func setupViewElements() {
    view.addSubview(backgroundView)
    view.addSubview(selectCarLabel)
    view.addSubview(carImageView)
    view.addSubview(backImageCarBtn)
    view.addSubview(nextImageCarBtn)
    view.addSubview(selectBarrierLabel)
    view.addSubview(barrierImageView)
    view.addSubview(backImageBarrierBtn)
    view.addSubview(nextImageBarrierBtn)
    view.addSubview(selectSpeedLabel)
    view.addSubview(saveSettingBtn)
    view.addSubview(speedPickerView)
    
}

// MARK: - Setup Appearance
private func setupAppearance() {
    setupAppearanceBackgroundView()
    setupAppearanceSelectCarLabel()
    setupAppearanceSelectCarLabel()
    setupAppearanceCarImageView()
    setupAppearanceBackCarImageBtn()
    setupAppearanceNextCarImageBtn()
    setupAppearanceSelectBarrierLabel()
    setupApperanceBarrierImageView()
    setupAppearanceBackBarrierImageBtn()
    setupAppearanceNextBarrierImageBtn()
    setupAppearanceSelectSpeedLabel()
    setupAppearanceSaveSettingsBtn()
    setupAppearanceSpeedPickerView()
    
}

// MARK: - Setup Layout
private func setupLayout() {
    NSLayoutConstraint.activate([
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        selectCarLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        selectCarLabel.heightAnchor.constraint(equalToConstant: 50),
        selectCarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        selectCarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
        
        carImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
        carImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
        carImageView.widthAnchor.constraint(equalToConstant: 80),
        carImageView.heightAnchor.constraint(equalToConstant: 120),
        
        backImageCarBtn.widthAnchor.constraint(equalToConstant: 64),
        backImageCarBtn.heightAnchor.constraint(equalToConstant: 64),
        backImageCarBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        backImageCarBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
        
        nextImageCarBtn.widthAnchor.constraint(equalToConstant: 64),
        nextImageCarBtn.heightAnchor.constraint(equalToConstant: 64),
        nextImageCarBtn.leadingAnchor.constraint(equalTo: backImageCarBtn.trailingAnchor, constant: 15),
        nextImageCarBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
        
        selectBarrierLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 280),
        selectBarrierLabel.heightAnchor.constraint(equalToConstant: 50),
        selectBarrierLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        selectBarrierLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        barrierImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
        barrierImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
        barrierImageView.widthAnchor.constraint(equalToConstant: 70),
        barrierImageView.heightAnchor.constraint(equalToConstant: 50),
        
        backImageBarrierBtn.widthAnchor.constraint(equalToConstant: 64),
        backImageBarrierBtn.heightAnchor.constraint(equalToConstant: 64),
        backImageBarrierBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        backImageBarrierBtn.centerYAnchor.constraint(equalTo: barrierImageView.centerYAnchor),
        
        nextImageBarrierBtn.widthAnchor.constraint(equalToConstant: 64),
        nextImageBarrierBtn.heightAnchor.constraint(equalToConstant: 64),
        nextImageBarrierBtn.leadingAnchor.constraint(equalTo: backImageBarrierBtn.trailingAnchor, constant: 15),
        nextImageBarrierBtn.centerYAnchor.constraint(equalTo: barrierImageView.centerYAnchor),
        
        selectSpeedLabel.heightAnchor.constraint(equalToConstant: 100),
        selectSpeedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        selectSpeedLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
        selectSpeedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
        
        speedPickerView.heightAnchor.constraint(equalToConstant: 100),
        speedPickerView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
        speedPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        speedPickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
        
        saveSettingBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        saveSettingBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        saveSettingBtn.widthAnchor.constraint(equalToConstant: 200),
        saveSettingBtn.heightAnchor.constraint(equalToConstant: 50)
        
    ])
}

// MARK: - Setup Bechavior
private func setupBechavior() {
    backImageCarBtn.addTarget(self, action: #selector(addActionBackImageCarBtn), for: .touchUpInside)
    nextImageCarBtn.addTarget(self, action: #selector(addActionNextImageCarBtn), for: .touchUpInside)
    
    backImageBarrierBtn.addTarget(self, action: #selector(addActionBackImageBarrierBtn), for: .touchUpInside)
    nextImageBarrierBtn.addTarget(self, action: #selector(addActionNextImageBarrierBtn), for: .touchUpInside)
    
    saveSettingBtn.addTarget(self, action: #selector(addActionSaveSettingsBtn), for: .touchUpInside)
    
}

// MARK: - Setup Appearance Background View
private func setupAppearanceBackgroundView(){
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.image = UIImage(named: "Road")
    
}

// MARK: - Setup Appearance Select Car Label
private func setupAppearanceSelectCarLabel() {
    selectCarLabel.translatesAutoresizingMaskIntoConstraints = false
    selectCarLabel.text = "Select Car"
    selectCarLabel.textColor = .white
    selectCarLabel.textAlignment = .center
    selectCarLabel.font = .boldSystemFont(ofSize: 26)
    
}

// MARK: - Setup Appearance Car Image View
private func setupAppearanceCarImageView(){
    carImageView.translatesAutoresizingMaskIntoConstraints = false
    carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    
}

// MARK: - Setup Appearance Back Car Image Btn
private func setupAppearanceBackCarImageBtn() {
    backImageCarBtn.translatesAutoresizingMaskIntoConstraints = false
    backImageCarBtn.setImage(UIImage(named: "back"), for: .normal)
    
}

// MARK: - Add Action BackImageCarBtn
@objc private func addActionBackImageCarBtn() {
    if currentCarImage == 0 {
        currentCarImage = arrayCarImage.count - 1
    } else {
        currentCarImage -= 1
    }
    carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    
}

// MARK: - Setup Appearance Next Car Image Btn
private func setupAppearanceNextCarImageBtn() {
    nextImageCarBtn.translatesAutoresizingMaskIntoConstraints = false
    nextImageCarBtn.setImage(UIImage(named: "next"), for: .normal)
    
}

// MARK: - Add Action NextImageCarBtn
@objc private func addActionNextImageCarBtn() {
    if currentCarImage == arrayCarImage.count - 1 {
        currentCarImage = 0
    } else {
        currentCarImage += 1
    }
    carImageView.image = UIImage(named: arrayCarImage[currentCarImage])
    
}

// MARK: - Setup Appearance Select Barrier Label
private func setupAppearanceSelectBarrierLabel() {
    selectBarrierLabel.translatesAutoresizingMaskIntoConstraints = false
    selectBarrierLabel.text = "Select Barrier"
    selectBarrierLabel.textColor = .white
    selectBarrierLabel.textAlignment = .center
    selectBarrierLabel.font = .boldSystemFont(ofSize: 26)
    
}

// MARK: - Setup Appearance Barrier Image View
private func setupApperanceBarrierImageView() {
    barrierImageView.translatesAutoresizingMaskIntoConstraints = false
    barrierImageView.image = UIImage(named: arrayBarrierImage[currentBarrierImage])
    
    
}

// MARK: - Setup Appearance Back Barrier Image Btn
func setupAppearanceBackBarrierImageBtn() {
    backImageBarrierBtn.translatesAutoresizingMaskIntoConstraints = false
    backImageBarrierBtn.setImage(UIImage(named: "back"), for: .normal)
    
}

// MARK: - Setup Appearance Next Barrier Image Btn
private func setupAppearanceNextBarrierImageBtn() {
    nextImageBarrierBtn.translatesAutoresizingMaskIntoConstraints = false
    nextImageBarrierBtn.setImage(UIImage(named: "next"), for: .normal)
    
}

// MARK: - Add Action Next Image Barrier Btn
@objc private func addActionNextImageBarrierBtn() {
    if currentBarrierImage == arrayBarrierImage.count - 1 {
        currentBarrierImage = 0
    } else {
        currentBarrierImage += 1
    }
    barrierImageView.image = UIImage(named: arrayBarrierImage[currentBarrierImage])
    
}

// MARK: - Add Action Back Image Barrier Btn
@objc func addActionBackImageBarrierBtn() {
    if currentBarrierImage == 0 {
        currentBarrierImage = arrayBarrierImage.count - 1
    } else {
        currentBarrierImage -= 1
    }
    barrierImageView.image = UIImage(named: arrayBarrierImage[currentBarrierImage])
    
}

// MARK: - Setup Appearance Select Speed Game Label
private func setupAppearanceSelectSpeedLabel() {
    selectSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
    selectSpeedLabel.text = "Select Speed Game"
    selectSpeedLabel.numberOfLines = 3
    selectSpeedLabel.textColor = .white
    selectSpeedLabel.textAlignment = .center
    selectSpeedLabel.font = .boldSystemFont(ofSize: 26)

}

// MARK: - Setup Appearance Speed Picker View
private func setupAppearanceSpeedPickerView() {
    speedPickerView.translatesAutoresizingMaskIntoConstraints = false
    speedPickerView.backgroundColor = .systemGray2
    speedPickerView.delegate = self
    speedPickerView.dataSource = self
}

// MARK: - Setup Appearance Save Settings Btn
private func setupAppearanceSaveSettingsBtn() {
    saveSettingBtn.translatesAutoresizingMaskIntoConstraints = false
    saveSettingBtn.layer.cornerRadius = 20
    saveSettingBtn.clipsToBounds = true
    saveSettingBtn.setTitle("Save Setting", for: .normal)
    saveSettingBtn.setTitleColor(.white, for: .normal)
    saveSettingBtn.backgroundColor = .systemGray3
    
}

// MARK: - Add Action Save Settings Btn
@objc private func addActionSaveSettingsBtn() {
    Settings.shared.currentSettings.Car = arrayCarImage[currentCarImage]
    Settings.shared.currentSettings.Barrier = arrayBarrierImage[currentBarrierImage]
    navigationController?.popToRootViewController(animated: true)
    
}
}

// MARK: - UIPickerViewDataSource extension
extension SettingViewController: UIPickerViewDataSource {
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return arraySpeedGame[component].count
    
}
}

// MARK: - UIPickerViewDelegate extension
extension SettingViewController: UIPickerViewDelegate {
func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let array = arraySpeedGame[component]
    return array[row]
    
}

func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if arraySpeedGame[row] == arraySpeedGame[0] {
        Settings.shared.currentSettings.SpeedGame = 2.5//2
        print("Save speed = Easy")
    }
    
    if arraySpeedGame[row] == arraySpeedGame[1] {
        Settings.shared.currentSettings.SpeedGame = 1.8//1.5
        print("Save speed = Normal")
    }
    
    if arraySpeedGame[row] == arraySpeedGame[2] {
        Settings.shared.currentSettings.SpeedGame = 1
        print("Save speed = Hard")
        
    }
}
}

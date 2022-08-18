//
//  RecordsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import Foundation
import UIKit

class RecordsViewController: UIViewController{
    
    //MARK: - UI Element's

    let userNameLabel = UILabel()
    let scoreUserLabel = UILabel()
    let backgroundView = UIImageView()
    let pickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupUserNameLabel()
        setupScoreUserLabel()
        datePicker()

    }
    
    //MARK: - Setup Layout
    
    func setupLayout() {
        
        backgroundView.image = UIImage(named: "menu")
        backgroundView.frame = view.frame
        backgroundView.center = view.center
        view.addSubview(backgroundView)
        
        
    }
    
    //MARK: - Setup userNameLabel
    
    func setupUserNameLabel() {
        
        userNameLabel.backgroundColor = .blue
        userNameLabel.layer.opacity = 0.75
        userNameLabel.textAlignment = .center
        userNameLabel.font = .boldSystemFont(ofSize: 26)
        userNameLabel.textColor = .white
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameLabel)
        
        if let name = UserDefaults.standard.object(forKey: "name") {
            userNameLabel.text = name as? String
        }
        
        NSLayoutConstraint.activate([
            userNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.25/3),
            userNameLabel.heightAnchor.constraint(equalToConstant: 50),
            userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    //MARK: - Setup ScoreUserLabel
    
    func setupScoreUserLabel() {
        
        scoreUserLabel.backgroundColor = .blue
        scoreUserLabel.layer.opacity = 0.75
        scoreUserLabel.textAlignment = .center
        scoreUserLabel.font = .boldSystemFont(ofSize: 26)
        scoreUserLabel.textColor = .white
        scoreUserLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreUserLabel)
        
        if let scoreUser = UserDefaults.standard.object(forKey: "scoreUser") {
            scoreUserLabel.text = scoreUser as? String
        }
        
        NSLayoutConstraint.activate([
            scoreUserLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.25 / 3),
            scoreUserLabel.heightAnchor.constraint(equalToConstant: 50),
            scoreUserLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            scoreUserLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    func datePicker(){
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerView.preferredDatePickerStyle = .compact
        pickerView.date = Date()
        pickerView.backgroundColor = .systemBlue
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        let stringDate = dateFormatter.string(from: currentDate)
        
        print(stringDate)
        
    }
    
}

//
//  ViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundView = UIImageView()
    
    let newGameButton = UIButton()
    let settingsButton = UIButton()
    let recordsButton = UIButton()
    let newUserButton = UIButton()
    
    let recordsVC = RecordsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
    }
    
    //MARK: - Setup Layout
    
    func setupLayout(){
        backgroundView.image = UIImage(named: "menu")
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let newUserButton = createNewButton(buttonTitle: "New Player")
        newUserButton.addTarget(self, action: #selector(createNewUser), for: .touchUpInside)
        view.addSubview(newUserButton)
       
        
        NSLayoutConstraint.activate([
            newUserButton.widthAnchor.constraint(equalToConstant: 200),
            newUserButton.heightAnchor.constraint(equalToConstant: 60),
            newUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newUserButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
       
        let newGameButton = createNewButton(buttonTitle: "New Game")
        newGameButton.addTarget(self, action: #selector(showGameView), for: .touchUpInside)
        view.addSubview(newGameButton)
        
        NSLayoutConstraint.activate([
            newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            newGameButton.widthAnchor.constraint(equalToConstant: 200),
            newGameButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let settingsButton = createNewButton(buttonTitle: "Settings")
        settingsButton.addTarget(self, action: #selector(showSettingView), for: .touchUpInside)
        view.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            settingsButton.centerXAnchor.constraint(equalTo: newGameButton.centerXAnchor),
            settingsButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 10),
            settingsButton.widthAnchor.constraint(equalToConstant: 200),
            settingsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let recordsButton = createNewButton(buttonTitle: "Records")
        recordsButton.addTarget(self, action: #selector(showRecordsView), for: .touchUpInside)
        view.addSubview(recordsButton)
        
        NSLayoutConstraint.activate([
            recordsButton.centerXAnchor.constraint(equalTo: settingsButton.centerXAnchor),
            recordsButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 10),
            recordsButton.widthAnchor.constraint(equalToConstant: 200),
            recordsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: - Show GameVC
    
    @objc func showGameView(){
        let viewController = NewGameViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    //MARK: - Show SettingVC
    
    @objc func showSettingView(){
        let viewController = SettingViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    //MARK: - Show RecordsVC
    
    @objc func showRecordsView(){
        let viewController = RecordsViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    //MARK: - New User Btn Action
    
    @objc func createNewUser() {
       alertNewUser()
    }
     
}








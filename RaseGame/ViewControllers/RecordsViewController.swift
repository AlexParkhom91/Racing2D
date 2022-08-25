//
//  RecordsViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import UIKit

class RecordsViewController: UIViewController {
    
    // MARK: - UI Element's
    private let backgroundView = UIImageView()
    private var scoreTableView = UITableView()
    let indentifire = "MyCell"
    let cell = UITableViewCell()

    
    // MARK: - Constants
    
    // MARK: - Variables
    
    var tableArray: [String] = []
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewElements()
        setupLayout()
        setupAppearance()
        saveCurrentDate()
        loadRecords()
        
        
    }
    
    // MARK: - Load Records
    private func loadRecords() {
        let scoreUser = Records.shared.currentRecords.saveScoreUser
        let userName = Records.shared.currentRecords.saveUserName
        let currentDate = Records.shared.currentRecords.saveDate

      
       
        
        
        let dataRecordsCell = "Date: \(currentDate) \nUser : \(userName) , score: \(scoreUser)"
        tableArray.append(dataRecordsCell)
        print(tableArray)
        
       
    }
    
   
    
    // MARK: - Save Current Date
    private func saveCurrentDate(){
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy HH:mm:ss"
        Records.shared.currentRecords.saveDate = df.string(from: Date())
        
    }
    
    // MARK: - Setup View Elements
    private func setupViewElements() {
        view.addSubview(backgroundView)
        view.addSubview(scoreTableView)
        
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            scoreTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            scoreTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scoreTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            scoreTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        
        ])
    }
    
    // MARK: - Setup Appearance
    private func setupAppearance() {
        setupAppearanceBackgroundView()
        setupAppearanceScoreTableView()
        
    }
    
    // MARK: - Setup Appearance Background View
    private func setupAppearanceBackgroundView(){
        backgroundView.image = UIImage(named: "menu")
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // MARK: - Setup Appearance Score Label
    private func setupAppearanceScoreTableView(){
        scoreTableView.translatesAutoresizingMaskIntoConstraints = false
        scoreTableView.layer.opacity = 0.5
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        scoreTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        scoreTableView.backgroundColor = .systemGray
       
    }
}



extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    
       
    }
   
    
}

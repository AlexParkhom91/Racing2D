//
//  NewGameViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import UIKit
class NewGameViewController: UIViewController {
    
    //MARK: - UI Elements
    
    let backgroundView = UIImageView()
    let carView = UIImageView()
    let stoneView = UIImageView()
    let custView = UIImageView()
    let scoreLabel = UILabel()
    let navigatonBarView = UIView()
    
    let LeftRoadSide = UIView()
    let RightRoadSide = UIView()
    
    var settingsGame = Setting(car: "car")
    var index = 0
    var score = 0
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayoutNewGameVC()
        setupCarView()
        setupStoneView()
        swipeCar()
      
    }
    
    //MARK: - View Did Appear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        moveStone()
        moveCust()
        setupScoreLabel()
        navigationBar()
    }
    
    //MARK: - Setup Layout
    
    func setupLayoutNewGameVC() {
        backgroundView.image = UIImage(named: "Road")
        backgroundView.frame = view.frame
        backgroundView.center = view.center
        view.addSubview(backgroundView)
        
        LeftRoadSide.frame = CGRect(x: 0, y: 0, width: 5, height: view.bounds.maxY)
        view.addSubview(LeftRoadSide)
        
        RightRoadSide.frame = CGRect(x: view.bounds.maxX - 5, y: view.bounds.minY - 5, width: 5, height: view.bounds.maxY)
        view.addSubview(RightRoadSide)
    }
   
    //MARK: -  Navigation Bar
    
    func navigationBar() {
       
       navigatonBarView.backgroundColor = .systemGray3
       navigatonBarView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 10)
        view.addSubview(navigatonBarView)
   }
    //MARK: - Score Label
    
    func setupScoreLabel(){
        let xScoreLabel = view.center.x
        let yScoreLabel = view.frame.minY

        scoreLabel.frame = CGRect(x: xScoreLabel - 50, y: yScoreLabel + 100, width: 100, height: 50)
        scoreLabel.backgroundColor = .systemBlue
        scoreLabel.layer.opacity = 0.75
        scoreLabel.layer.cornerRadius = 12.5
        scoreLabel.clipsToBounds = true
        scoreLabel.text = "\(score)"
        scoreLabel.textAlignment = .center
        scoreLabel.font = .boldSystemFont(ofSize: 26)
        view.addSubview(scoreLabel)
        
    }
    
    //MARK: - Car View
    
    func setupCarView(){
        let xCar: CGFloat = view.center.x
        let yCar: CGFloat = view.frame.maxY - view.frame.height / 4
        let widthCar: CGFloat = view.frame.width / 5
        let heightCar: CGFloat = view.frame.height / 5
        
        carView.image = UIImage(named: "Car")
        carView.isUserInteractionEnabled = true
        carView.frame = CGRect(x: xCar, y: yCar, width: widthCar, height: heightCar)
        view.addSubview(carView)
        
        carImage()
    }
    
    //MARK: - Stone View
    
    func setupStoneView() {
        let xStone:CGFloat = CGFloat(Int.random(in: Int(view.frame.minX)...Int((view.frame.maxX) - view.frame.width / 5)))
        let yStone:CGFloat = view.frame.minY + 10
        let widthStone: CGFloat = view.frame.width / 5
        let heightStone: CGFloat = view.frame.height / 14
        
        stoneView.image = UIImage(named: "Stone")
        stoneView.frame = CGRect(x: xStone, y: yStone, width: widthStone, height: heightStone)
        backgroundView.addSubview(stoneView)
        
    }
    func setupCustView() {
        let xCust:CGFloat = CGFloat(Int.random(in: Int(view.frame.minX)...Int((view.frame.maxX) - view.frame.width / 5)))
        let yCust:CGFloat = view.frame.minY + 10
        let widthCust: CGFloat = view.frame.width / 5
        let heightCust: CGFloat = view.frame.height / 14
        
        custView.image = UIImage(named: "Cust")
        custView.frame = CGRect(x: xCust, y: yCust, width: widthCust, height: heightCust)
        backgroundView.addSubview(custView)
        
    }
    
    //MARK: - Stone View Animated
    
    func moveStone(){
        setupStoneView()
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { self.stoneView.frame.origin.y = self.carView.frame.origin.y - self.stoneView.bounds.height + 1 },
                       completion: { _ in
            if self.stoneView.frame.intersects(self.carView.frame) {
                self.alertGameOver()
                self.custView.isHidden = true
                self.stopBarrier()
            }
            else {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: .curveLinear,
                               animations: { self.stoneView.frame.origin.y = self.view.frame.maxY },
                               completion: { _ in
                    self.moveStone()
                    self.score += 1
                    self.setupScoreLabel()
                   
                    
                })
            }
        })
    }
    func moveCust(){
        setupCustView()
        UIView.animate(withDuration: 1,
                       delay: 2,
                       options: .curveLinear,
                       animations: { self.custView.frame.origin.y = self.carView.frame.origin.y - self.custView.bounds.height + 1 },
                       completion: { _ in
            if self.custView.frame.intersects(self.carView.frame) {
                self.alertGameOver()
                self.stoneView.isHidden = true
                self.stopBarrier()
            }
            else {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: .curveLinear,
                               animations: { self.custView.frame.origin.y = self.view.frame.maxY },
                               completion: { _ in
                    self.moveCust()
                    self.score += 1
                    self.setupScoreLabel()
                   
                    
                })
            }
        })
    }
    
    func stopBarrier(){
        stoneView.stopAnimating()
        custView.stopAnimating()
    }
    
    // MARK: Create gesture
    
    func swipeCar() {
        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveCar(recognizer:)))
        carView.addGestureRecognizer(moveGesture)
        
    }
    
    @objc func moveCar(recognizer: UIPanGestureRecognizer){
        let yCar: CGFloat = view.frame.maxY - view.frame.height / 4
        let widthCar: CGFloat = view.frame.width / 5
        let heightCar: CGFloat = view.frame.height / 7
        
        if recognizer.state == .changed {
            
            let translation: CGPoint = recognizer.translation(in: self.view)
            carView.center = CGPoint(x: carView.center.x + translation.x, y: yCar + heightCar / 2)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            if carView.frame.minX < view.frame.minX {
                carView.frame = CGRect(x: view.frame.minX, y: yCar, width: widthCar, height: heightCar)
                
            }
            
            if carView.frame.maxX > view.frame.maxX {
                carView.frame = CGRect(x: view.frame.maxX - widthCar, y: yCar, width: widthCar , height: heightCar)
                
            }
        }
        
        roadSideAlert()
        
    }
  
    //MARK: - Load Settings
    
    func loadSettings () {
       if let settings = UserDefaults.standard.value(Setting.self, forKey: "settings"){
            self.settingsGame = settings
        }
    }
    func carImage() {
        loadSettings()
        let image = UIImage(named: self.settingsGame.car)
        self.carView.image = image
    }
}

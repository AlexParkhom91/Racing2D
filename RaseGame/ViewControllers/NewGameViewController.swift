//
//  NewGameViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//



import UIKit
class NewGameViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private let backgroundView = UIImageView()
    private let carImageView = UIImageView()
    private let stoneView = UIImageView()
    private let scoreLabel = UILabel()
    private let LeftRoadSide = UIView()
    private let RightRoadSide = UIView()
    
    //MARK: - Variables
    
    private var settingsGame = Setting(car: "car", barrier: "Barrier")
    private var index = 0
    private var score = 0
    private var scoreObserver = true
    private var roadSideObserver = true
    
    //MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayoutNewGameVC()
        setupScoreLabel()
        setupCarView()
        swipeCar()
        
    }
    
    //MARK: - View Did Appear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        moveStone()
        
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
    
    //MARK: - RoadSide Check
    
    func roadSideCheck(){
        if carImageView.frame.intersects(LeftRoadSide.frame) || carImageView.frame.intersects(RightRoadSide.frame){
            
            roadSideObserver = false
            alertGameOver()
            
        }
    }
    
    //MARK: - Score Label
    
    func setupScoreLabel(){
        scoreLabel.frame = CGRect(x: 0, y: 50, width: 100, height: 50)
        scoreLabel.center.x = view.center.x
        scoreLabel.backgroundColor = .systemGray3
        scoreLabel.layer.opacity = 0.75
        scoreLabel.layer.cornerRadius = 12.5
        scoreLabel.clipsToBounds = true
        scoreLabel.text = "\(score)"
        scoreLabel.textAlignment = .center
        scoreLabel.font = .boldSystemFont(ofSize: 26)
        view.addSubview(scoreLabel)
        
    }
    
    //MARK: - Car Image View
    
    func setupCarView(){
        let xCar: CGFloat = view.center.x
        let yCar: CGFloat = view.frame.maxY - view.frame.height / 4
        let widthCar: CGFloat = view.frame.width / 4.25
        let heightCar: CGFloat = view.frame.height / 6
        
        carImageView.image = UIImage(named: "Car")
        carImageView.isUserInteractionEnabled = true
        carImageView.frame = CGRect(x: xCar, y: yCar, width: widthCar, height: heightCar)
        view.addSubview(carImageView)
        
        carImage()
        
    }
    
    //MARK: - Stone View
    
    func setupStoneView() {
        let xStone:CGFloat = CGFloat(Int.random(in: Int(view.frame.minX)...Int((view.frame.maxX) - view.frame.width / 5)))
        let yStone:CGFloat = view.frame.minY + 10
        let widthStone: CGFloat = view.frame.width / 4.25
        let heightStone: CGFloat = view.frame.height / 14
        
        stoneView.image = UIImage(named: "Stone")
        stoneView.frame = CGRect(x: xStone, y: yStone, width: widthStone, height: heightStone)
        view.addSubview(stoneView)
        barrierImage()
    }
    
    //MARK: - Stone View Animated
    
    func moveStone(){
        
        if roadSideObserver == false {
            
            self.alertGameOver()
            self.setupScoreLabel()
            
        } else {
            let speed = UserDefaults.standard.double(forKey: "speed")
            
            setupStoneView()
            
            UIView.animate(withDuration: speed,
                           delay: 0,
                           options: .curveLinear,
                           animations: { self.stoneView.frame.origin.y = self.carImageView.frame.origin.y - self.stoneView.bounds.height + 1 },
                           completion: { _ in
                
                if self.stoneView.frame.intersects(self.carImageView.frame) {
                    
                    self.alertGameOver()
                    
                } else {
                    UIView.animate(withDuration: speed / 2,
                                   delay: 0,
                                   options: .curveLinear,
                                   animations: { self.stoneView.frame.origin.y = self.view.frame.maxY },
                                   completion: { _ in
                        self.moveStone()
                        self.score += 1
                        if self.roadSideObserver == true {  self.setupScoreLabel() } else {
                            return
                        }
                    })
                }
            })
        }
    }
    
    // MARK: Swipe Gesture Recognizer
    
    func swipeCar() {
        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveCar(recognizer:)))
        carImageView.addGestureRecognizer(moveGesture)
        
    }
    
    @objc func moveCar(recognizer: UIPanGestureRecognizer){
        let yCar: CGFloat = view.frame.maxY - view.frame.height / 4
        let widthCar: CGFloat = view.frame.width / 4.25
        let heightCar: CGFloat = view.frame.height / 7
        
        if recognizer.state == .changed {
            
            let translation: CGPoint = recognizer.translation(in: self.view)
            carImageView.center = CGPoint(x: carImageView.center.x + translation.x, y: yCar + heightCar / 2)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
            if carImageView.frame.minX < view.frame.minX {
                carImageView.frame = CGRect(x: view.frame.minX, y: yCar, width: widthCar, height: heightCar)
                
            }
            
            if carImageView.frame.maxX > view.frame.maxX {
                carImageView.frame = CGRect(x: view.frame.maxX - widthCar, y: yCar, width: widthCar , height: heightCar)
                
            }
        }
        
        roadSideCheck()
        
    }
    
    //MARK: - Load Settings
    
    func loadSettings () {
        if let settings = UserDefaults.standard.value(Setting.self, forKey: "settings"){
            settingsGame = settings
        }
    }
    func carImage() {
        loadSettings()
        let imageCar = UIImage(named: settingsGame.car)
        carImageView.image = imageCar
        
    }
   func barrierImage() {
        loadSettings()
        let imageBarrier = UIImage(named: settingsGame.barrier)
        stoneView.image = imageBarrier
    }
}



extension NewGameViewController {
        func alertGameOver() {
            let alert = UIAlertController(title: "Game Over",message: "Score: \(scoreLabel.text!)", preferredStyle: .alert)
            
            UserDefaults.standard.set(scoreLabel.text!, forKey: "scoreUser")
            
            alert.addAction(UIAlertAction(title: "Main Menu", style: .default) { _ in
                self.navigationController?.popToRootViewController(animated: true)
                
            })
            self.present(alert, animated: true)
            
        }
    }

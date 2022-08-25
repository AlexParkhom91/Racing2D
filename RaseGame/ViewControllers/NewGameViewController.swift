//
//  NewGameViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//



import UIKit
class NewGameViewController: UIViewController {
    
    
    // MARK: - UI Elements
    private let backgroundView = UIImageView()
    private let carImageView = UIImageView()
    private let barrierImageView = UIImageView()
    private let scoreLabel = UILabel()
    
    private let leftRoadSide = UIView()
    private let rightRoadSide = UIView()
    
    // MARK: - Variables
    private var score = 0
    private var scoreObserver = true
    private var roadSideCheckObserver = true
    private var emptyRecordsArray = [Int]()
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewElements()
        setupLayout()
        setupAppearance()
        swipeCar()
        //saveCurrentDate()
        
    }
    
    // MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        moveBarrier()
        
    }
    
    // MARK: - Setup View Element's
    private func setupViewElements() {
        view.addSubview(backgroundView)
        view.addSubview(leftRoadSide)
        view.addSubview(rightRoadSide)
        view.addSubview(scoreLabel)
        view.addSubview(carImageView)
        view.addSubview(barrierImageView)
        
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        setupLayoutBackgroundView()
        setupLayoutRoadSideView()
        setupLayoutScoreLabel()
        setupLayoutCarImageView()
        setupLayoutBarrierImageView()
        
    }
    
    // MARK: - Setup Appearance
    private func setupAppearance() {
        setupAppearanceScoreLabel()
        setupAppearanceCarImageView()
        setupAppearanceBarrierImageView()
        
    }
    
    // MARK: - Setup Layout Background View
    private func setupLayoutBackgroundView() {
        backgroundView.image = UIImage(named: "Road")
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
    }
    
    // MARK: - Setup Layout RoadSide View
    private func setupLayoutRoadSideView() {
        leftRoadSide.frame = CGRect(x: 0, y: 0, width: 5, height: view.bounds.height)
        rightRoadSide.frame = CGRect(x: view.bounds.maxX - 5, y: view.bounds.minY - 5, width: 5, height: view.bounds.height)
        
    }
    
    // MARK: - Setup RoadSide Check
    private func setupRoadSideCheck() {
        if carImageView.frame.intersects(leftRoadSide.frame) || carImageView.frame.intersects(rightRoadSide.frame) {
            roadSideCheckObserver = false
            alertGameOver()
            
        }
    }
    
    // MARK: - Setup Appearance Score Label
    private func setupAppearanceScoreLabel() {
        scoreLabel.backgroundColor = .systemGray2
        scoreLabel.layer.opacity = 0.85
        scoreLabel.layer.cornerRadius = 12.5
        scoreLabel.clipsToBounds = true
        scoreLabel.text = "\(score)"
        scoreLabel.textAlignment = .center
        scoreLabel.font = .boldSystemFont(ofSize: 26)
        
    }
    
    // MARK: - Setup Layout Score Label
    private func setupLayoutScoreLabel() {
        let xScoreLabel = view.bounds.width / 2 - 40
        let yScoreLabel = view.bounds.minY + 40
        scoreLabel.frame = CGRect(x: xScoreLabel, y: yScoreLabel, width: 80, height: 40)
        
    }
    
    // MARK: - Setup Appearance Car Image View
    private func setupAppearanceCarImageView() {
        let xCar: CGFloat = view.center.x
        let yCar: CGFloat = view.frame.maxY - view.frame.height / 4.5
        
        carImageView.frame = CGRect(x: xCar, y: yCar, width: view.frame.width / 5, height: view.frame.height / 7)
        
    }
    
    // MARK: - Setup Car Image View
    private func setupLayoutCarImageView() {
        carImageView.image = UIImage(named: Settings.shared.currentSettings.Car)
        carImageView.isUserInteractionEnabled = true
        
    }
    
    // MARK: - Setup Appearance Barrier Image View
    private func setupAppearanceBarrierImageView() {
        let xStone:CGFloat = CGFloat(Int.random(in: Int(view.frame.minX + 10)...Int((view.frame.maxX) - view.frame.width / 5)))
        let yStone:CGFloat = view.frame.minY - 100
        
        barrierImageView.frame = CGRect(x: xStone, y: yStone, width: view.frame.width / 5, height: view.frame.height / 16)
        
    }
    
    // MARK: - Setup Layout Barrier View
    private func setupLayoutBarrierImageView() {
        barrierImageView.image = UIImage(named: Settings.shared.currentSettings.Barrier)
        
    }
    
    // MARK: - Barrier Image View Animated
    private func moveBarrier(){
        if roadSideCheckObserver == false {
            
            self.alertGameOver()
            self.setupAppearanceScoreLabel()
            
        } else {
            setupAppearanceBarrierImageView()
            
            UIView.animate(withDuration: TimeInterval(Settings.shared.currentSettings.SpeedGame),
                           delay: 0,
                           options: .curveLinear,
                           animations: { self.barrierImageView.frame.origin.y = self.carImageView.frame.origin.y - self.barrierImageView.bounds.height + 1 },
                           completion: { _ in
                
                if self.barrierImageView.frame.intersects(self.carImageView.frame) {
                    
                    self.alertGameOver()
                    
                } else {
                    UIView.animate(withDuration: TimeInterval(Settings.shared.currentSettings.SpeedGame) / 2,
                                   delay: 0,
                                   options: .curveLinear,
                                   animations: { self.barrierImageView.frame.origin.y = self.view.frame.maxY },
                                   completion: { _ in
                        self.moveBarrier()
                        self.score += 1
                        if self.roadSideCheckObserver == true {
                            self.setupAppearanceScoreLabel()
                            
                        } else {
                            return
                        }
                    })
                }
            })
        }
    }
    
    // MARK: Swipe Car Gesture Recognizer
    private func swipeCar() {
        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(moveCar(recognizer:)))
        carImageView.addGestureRecognizer(moveGesture)
        
    }
    
    @objc private func moveCar(recognizer: UIPanGestureRecognizer) {
        let yCar: CGFloat = view.frame.maxY - view.frame.height / 4.5
        let widthCar: CGFloat = view.frame.width / 5
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
        setupRoadSideCheck()
    }
}

extension NewGameViewController {
    
    // MARK: - Alert Game Over
    func alertGameOver() {
        let alert = UIAlertController(title: "Game Over",message: "Score: \(scoreLabel.text!)", preferredStyle: .alert)
        
        Records.shared.currentRecords.saveScoreUser = score
     
        alert.addAction(UIAlertAction(title: "Main Menu", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
            
        })
        self.present(alert, animated: true)
        
    }
}

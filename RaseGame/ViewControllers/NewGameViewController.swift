//
//  NewGameViewController.swift
//  RaseGame
//
//  Created by Александр Пархамович on 13.07.22.
//

import UIKit
enum CarMovement {
    case left, right
}

class NewGameViewController: UIViewController {
    
    // MARK: - UIImage & UIView
    
    private let CarView = UIImageView()
    private let StoneView = UIImageView()
    private let CustView = UIImageView()
    private let BackgroundView = UIImageView()
    private let roadsideLeftView = UIView()
    private let roadsideRightView = UIView()
    private let navigatonBarView = UIView()
    
    // MARK: - Struct objects
    
    let CarStep: CGFloat = 50
    private var variable = Variables()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundView.bounds = view.bounds
        BackgroundView.center = view.center
        BackgroundView.image = UIImage(named: "Road")
        view.addSubview(BackgroundView)
        
        title = "Racing"
        
        roadside()
        setupCarView()
        swipeCar()
        stoneAnimation()
        navigationBar()
        custAnimation()
        
    }
    
    // MARK: - Functions of the game
    
     func roadside() {
        
        roadsideLeftView.backgroundColor = .systemGray3
        roadsideRightView.backgroundColor = .systemGray3
        
        variable.roadsideWidth = view.bounds.width / 14
        variable.roadsideHeight = view.bounds.height
        
        roadsideLeftView.frame = CGRect(x: BackgroundView.frame.minX - variable.roadsideWidth / 2, y: BackgroundView.frame.minY, width: variable.roadsideWidth, height: variable.roadsideHeight)
        roadsideRightView.frame = CGRect(x: BackgroundView.frame.maxX - variable.roadsideWidth / 2, y: view.frame.minY, width: variable.roadsideWidth, height: variable.roadsideHeight)
        
        view.addSubview(roadsideRightView)
        view.addSubview(roadsideLeftView)
    }
    
     func startGame() {
        
        variable.carWidth = BackgroundView.bounds.width / 5
         variable.carHeight = variable.carWidth * 1.9
        
        variable.carXCoord = BackgroundView.center.x
        variable.carYCoord = BackgroundView.frame.maxY - (variable.carHeight + 20)
        
        CarView.frame = CGRect(x: variable.carXCoord, y: variable.carYCoord, width: variable.carWidth , height: variable.carHeight)
    }
    
     func setupCarView() {
        
        startGame()
        CarView.image = UIImage(named: "Car")
        CarView.contentMode = .scaleToFill
        view.addSubview(CarView)
       
    }
    
     func swipeCar() {
        
        CarView.isUserInteractionEnabled = true
        
        let SwipeLeft = UISwipeGestureRecognizer()
        let SwipeRight = UISwipeGestureRecognizer()
        
        SwipeLeft.direction = .left
        SwipeRight.direction = .right
        
        SwipeLeft.addTarget(self, action: #selector(MoveLeft))
        SwipeRight.addTarget(self, action: #selector(MoveRight))
        
        CarView.addGestureRecognizer(SwipeLeft)
        CarView.addGestureRecognizer(SwipeRight)
    }
    
     func stone() {
        
        view.addSubview(StoneView)
        StoneView.center.x = CGFloat(Int.random(in: Int(variable.roadsideWidth + (variable.carWidth / 12))...Int(BackgroundView.bounds.maxX - variable.roadsideWidth - (variable.carWidth / 12))))
        StoneView.center.y = 0
         StoneView.bounds = CGRect(x: 0, y: 0, width: variable.carWidth / 1.25, height: variable.carHeight / 2)
        StoneView.image = UIImage(named: "Stone")

    }
    func cust() {
       
       view.addSubview(CustView)
        CustView.center.x = CGFloat(Int.random(in: Int(variable.roadsideWidth + (variable.carWidth / 12))...Int(BackgroundView.bounds.maxX - variable.roadsideWidth - (variable.carWidth / 12))))
        CustView.center.y = 0
        CustView.bounds = CGRect(x: 0, y: 0, width: variable.carWidth / 1.25, height: variable.carHeight / 2.2 )
        CustView.image = UIImage(named: "Cust")

   }
    
     func stoneAnimation() {
        
        stone()
        
        UIView.animate(
            withDuration: 2.5,
            delay: 0,
            options: .curveLinear
        ) {
            self.StoneView.frame.origin.y = self.CarView.frame.origin.y - (self.variable.carHeight / 2.5 )
        } completion: { _ in
            self.crash()
            
        }
    }
    func custAnimation() {
       
       cust()
       
       UIView.animate(
           withDuration: 2.5,
           delay: 1,
           options: .curveLinear
       ) {
           self.CustView.frame.origin.y = self.CarView.frame.origin.y - (self.variable.carHeight / 2.5 )
       } completion: { _ in
           self.crashCust()
       }
    
   }
    
     func crash() {
        if CarView.frame.intersects(StoneView.frame) {
            crashAlert()
        } else {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                options: .curveLinear
            ) {
                self.StoneView.frame.origin.y = self.BackgroundView.frame.maxY
            } completion: { _ in
                self.stoneAnimation()
                self.navigationBar()
            }
        }
    }
    func crashCust() {
       if CarView.frame.intersects(CustView.frame) {
           crashAlert()
       } else {
           UIView.animate(
               withDuration: 1,
               delay: 0,
               options: .curveLinear
           ) {
               self.CustView.frame.origin.y = self.BackgroundView.frame.maxY
           } completion: { _ in
               self.custAnimation()
               self.navigationBar()
           }
       }
   }
    
     func navigationBar() {
        
        navigatonBarView.backgroundColor = .systemGray3
        navigatonBarView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 10)
        
        view.addSubview(navigatonBarView)
    }
    
     func crashAlert() {
         stopGame()
        let alert: UIAlertController = UIAlertController(
            title: "GAME OVER",
            message: "CRASH",
            preferredStyle: .alert
        )
        
        // Exit
        alert.addAction(UIAlertAction(
            title: "Quit",
            style: .destructive
        ) {_ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        )
        
        // New Game
        alert.addAction(UIAlertAction(
            title: "New Game",
            style: .default
        ) {_ in
            if self.CarView.frame.intersects(self.StoneView.frame) {
                self.stoneAnimation()
            }
            if self.CarView.frame.intersects(self.CustView.frame){
                self.custAnimation()
            }
            self.startGame()
            self.navigationBar()
            self.CustView.isHidden = false
            self.StoneView.isHidden = false
            
        }
        )
        self.present(alert, animated: true)
    }
    
     func movement (_ direction: CarMovement) {
        
        switch direction {
        case .left:
            variable.carXCoord -= CarStep
        case .right:
            variable.carXCoord += CarStep
        }
        CarView.frame = CGRect(x: variable.carXCoord, y: variable.carYCoord, width: variable.carWidth, height: variable.carHeight)
        checkRoadside()
    }
    
    private func checkRoadside() {
        
        if CarView.frame.intersects(roadsideLeftView.frame) || CarView.frame.intersects(roadsideRightView.frame) {
            crashAlert()
        }
    }
    
    func stopGame(){
        if self.CarView.frame.intersects(StoneView.frame){
            CustView.isHidden = true
        }
        else{ CustView.isHidden = false
            
        }
        if self.CarView.frame.intersects(CustView.frame){
            StoneView.isHidden = true
        }
        else{ StoneView.isHidden = false
        }
        if CarView.frame.intersects(roadsideLeftView.frame) || CarView.frame.intersects(roadsideRightView.frame){
            CustView.isHidden = true
            StoneView.isHidden = true
        }
        
    }
    
    // MARK: - Selectors
    
    @objc private func MoveLeft() {
        movement(.left)
    }
    
    @objc private func MoveRight() {
        movement(.right)
    }
}

extension NewGameViewController {
    
    // MARK: - Variables
    
    private struct Variables {
        
        var roadsideWidth = CGFloat()
        var roadsideHeight = CGFloat()
        
        var carWidth = CGFloat()
        var carHeight = CGFloat()
        
        var carXCoord = CGFloat()
        var carYCoord = CGFloat()
    }
    
  
}


//
//  Funtoins.swift
//  RaseGame
//
//  Created by Александр Пархамович on 15.07.22.
//

import Foundation
import UIKit

func stone(){
StoneView.frame = CGRect(x: BackgroundView.bounds.width / 2, y: BackgroundView.bounds.minY - 100, width: 80, height: 80)
StoneView.image = StoneImage
view.addSubview(StoneView)
}

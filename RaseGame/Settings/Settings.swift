//
//  Settings.swift
//  RaseGame
//
//  Created by Александр Пархамович on 4.08.22.
//

import Foundation
import UIKit

class Setting: Codable {
    
    var car: String
    var barrier: String
    
    
    init(car: String, barrier: String){
        self.car = car
        self.barrier = barrier
    
    }
    
    public enum CodingKeys: String, CodingKey {
        case car,barrier
        
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.car = try container.decode(String.self, forKey: .car)
        self.barrier = try container.decode(String.self, forKey: .barrier)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.car, forKey: .car)
        try container.encode(self.barrier, forKey: .barrier)
        
    }
}


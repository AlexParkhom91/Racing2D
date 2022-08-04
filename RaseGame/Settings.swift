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
    
    init(car: String){
        self.car = car
    }
    
    public enum CodingKeys: String, CodingKey {
        case car
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.car = try container.decode(String.self, forKey: .car)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.car, forKey: .car)
    }
}


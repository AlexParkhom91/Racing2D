//
//  Records.swift
//  RaseGame
//
//  Created by Александр Пархамович on 4.08.22.
//

import Foundation
import UIKit

enum RecordsKey{
   static let recordsGameKey = "recordsGame"
    
}

struct RecordsGame: Codable {
    var saveUserName: String
    var saveScoreUser: Int
    var saveDate: String
}

class Records {
    
    static var shared = Records()

    private let defaultRecords = RecordsGame(saveUserName: "Default", saveScoreUser: 0, saveDate: "22/02/2022 00:00")
    
    var currentRecords:RecordsGame {
        get{
            if let data = UserDefaults.standard.object(forKey: RecordsKey.recordsGameKey) as? Data{
                return try! PropertyListDecoder().decode(RecordsGame.self, from: data)
            } else {
                if let data = try? PropertyListEncoder().encode(defaultRecords){
                    UserDefaults.standard.setValue(data, forKey: RecordsKey.recordsGameKey)

                           }
                return defaultRecords
            }
        }
        set {
            
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: RecordsKey.recordsGameKey)
               
            }
        }
    }
}


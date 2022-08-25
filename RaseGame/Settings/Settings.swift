//
//  Settings.swift
//  RaseGame
//
//  Created by Александр Пархамович on 4.08.22.
//

import Foundation

enum KeysUserDefault{
   static let settingsGameKey = "settingsGame"
}

struct SettingsGame: Codable {
    var Car: String
    var Barrier: String
    var SpeedGame: Double
    
}

class Settings {
    
    static var shared = Settings()

    private let defaultSettings = SettingsGame(Car: "Car", Barrier: "Cust", SpeedGame: 1.5)
    
    var currentSettings:SettingsGame{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefault.settingsGameKey) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            } else {
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.setValue(data, forKey: KeysUserDefault.settingsGameKey)

                           }
                return defaultSettings
            }
        }
        set {
            
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefault.settingsGameKey)
               
            }
        }
    }
}

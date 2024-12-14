//
//  FileManagerHelper.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 10.12.24.
//

import Foundation

class FileManagerHelper {
    func getFilePathInDocument(fileName: String) -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let fileURL = files[0].appendingPathComponent(fileName)
        
        print(fileURL)
        
        return fileURL
    }
    
    func readUserData() -> [User] {
        let filePath = getFilePathInDocument(fileName: "users.json")
        
        if let dataJson = try? Data(contentsOf: filePath),
           let data = try? JSONDecoder().decode([User].self, from: dataJson) {
            return data
        }
        
        return []
    }
    
    func writeUserData(users: [User])
    {
        let jsonUsers = try! JSONEncoder().encode(users)
        let filePath = getFilePathInDocument(fileName: "users.json")
        
        do {
            try jsonUsers.write(to: filePath)
        } catch {
            
        }
    }
    
//-----------------------------------------------------------
    func readCategriesWithFoods() -> [CategoryFood] {
        if let fileUrl = Bundle.main.url(forResource: "foods", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                return try JSONDecoder().decode([CategoryFood].self, from: data)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        return []
    }
    
    func readBasketData() -> [Food] {
        let filePath = getFilePathInDocument(fileName: "basket.json")
        
        if let dataJson = try? Data(contentsOf: filePath),
           let data = try? JSONDecoder().decode([Food].self, from: dataJson) {
            return data
        }

        return []
    }
    
    func writeBasketData(foods: [Food])
    {
        let jsonFood = try! JSONEncoder().encode(foods)
        let filePath = getFilePathInDocument(fileName: "basket.json")
        
        do {
            try jsonFood.write(to: filePath)
        } catch {
            
        }
    }
}


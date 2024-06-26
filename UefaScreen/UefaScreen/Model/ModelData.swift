//
//  ModelData.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 20/06/24.
//

import Foundation

var allMatches: [MatchDays] = load("MatchData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
//    printData(data: data)
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//private func printData(data:Data) {
//    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]{
//      print(json)
//    } else {
//      print("Wrong data")
//    }
//  }

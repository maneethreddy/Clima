//
//  WeatherData.swift
//  Clima
//
//  Created by MANEETH REDDY on 07/07/24.
//  
//

import Foundation

struct WeatherData: Codable {   //decodable + encodable = codable
    let name: String
    let main: Main
    let weather: [Weather] // bcoz it is in array
}
struct Main: Codable {
    let temp: Double
}
struct Weather: Codable {
    let description: String
    let id: Int
}

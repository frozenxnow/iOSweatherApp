//
//  Forecast.swift
//  iOSweatherApp
//
//  Created by 지원 on 2021/04/27.
//

import Foundation

struct Forecast: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    
    
    
    struct ListItem: Codable {
        let dt: Int
        
        struct Main: Codable {
            let temp: Double
        }
        
        struct Weather: Codable {
            let description: String
            let icon: String
        }
        
        let main: Main
        let weather: [Weather]
    }
    
    let list: [ListItem]
}

struct ForecastData {
    let date: Date
    let icon: String
    let weather: String
    let temperature: Double
}

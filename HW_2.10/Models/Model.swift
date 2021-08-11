//
//  Model.swift
//  HW_2.10
//
//  Created by User on 08.08.2021.
//
import UIKit

struct WeatherModel: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
    let wind: Wind
    
    init(name: String, weather: [Weather], main: Main, wind: Wind) {
        self.name = name
        self.weather = weather
        self.main = main
        self.wind = wind
    }
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Main: Codable {
    let temp: Double
}

struct Wind: Codable {
    let speed: Double
}


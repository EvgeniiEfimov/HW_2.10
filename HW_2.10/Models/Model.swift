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


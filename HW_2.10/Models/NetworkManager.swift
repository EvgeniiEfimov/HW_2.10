//
//  NetworkManager.swift
//  HW_2.10
//
//  Created by User on 08.08.2021.
//
import UIKit
import Alamofire


class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func feathWeather(nameCity: String, handler: @escaping (WeatherModel)-> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(nameCity)&lang=ru&units=metric&appid=259a3e00b4d059cd73b9bdbfc7dcc8fd"
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: WeatherModel.self) { (currentWeather) in
                switch currentWeather.result {
                case .success(let weather):
//                    self.weatherModel = weatherModel
                    DispatchQueue.main.async {
                        handler(weather)
                    }
                case .failure(let errorAF):
                    print(errorAF)
                }
            }
    } 
    
    
}

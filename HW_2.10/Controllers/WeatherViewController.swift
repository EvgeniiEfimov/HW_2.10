//
//  ViewController.swift
//  HW_2.10
//
//  Created by User on 08.08.2021.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelWind: UILabel!
    
    @IBOutlet weak var stackViewInfo: UIStackView!
   
    var networkManager = NetworkManager()
    
    private var valueCity: String = ""
    
    @IBAction func Go() {
        shouAlert()
    }
    
    private func shouAlert(){
        let alert = UIAlertController(title: "Здравствуйте!",
                                      message: "Пожалуйста, введите город",
                                      preferredStyle: .alert)
        alert.addTextField { (textField) in
            self.valueCity = textField.text ?? ""
            textField.delegate = self
        }
        
        alert.addAction(UIAlertAction(title: "GO",
                                      style: .default,
                                      handler: { (alertAction) in
                                        
                                        self.feathWeather(city: self.valueCity)
                                        
                                      }))
        self.present(alert, animated: true, completion: nil)
    }
    private func hiddenStak() {
        stackViewInfo.isHidden = false
    }
    
    
    private func feathWeather(city: String) {
        NetworkManager.shared.feathWeather(nameCity: city) { (weatherModel) in
            self.hiddenStak()
            self.labelCityName.text = weatherModel.name
            self.labelDescription.text = weatherModel.weather.last?.description
            self.labelTemperature.text = String(format: "%.0f", weatherModel.main.temp)+" ℃"
            self.labelWind.text = "Скорость ветра: " + String(format: "%.0f", weatherModel.wind.speed) + " М/C"
            
            
            guard let idValue = weatherModel.weather.first?.id else { return }
            idValue == 800 ? (self.imageWeather.tintColor = UIColor.yellow) :
                (self.imageWeather.tintColor = UIColor.gray)
            
            switch idValue {
            case (200...232):
                self.imageWeather.image = UIImage(systemName: "tornado")
            case (300...321):
                self.imageWeather.image = UIImage(systemName: "cloud.drizzle.fill")
            case (500...531):
                self.imageWeather.image = UIImage(systemName: "cloud.rain.fill")
            case (600...622):
                self.imageWeather.image = UIImage(systemName: "snow")
            case (701...781):
                self.imageWeather.image = UIImage(systemName: "smoke.fill")
            case 800:
                self.imageWeather.image = UIImage(systemName: "sun.max.fill")
            case (801...804):
                self.imageWeather.image = UIImage(systemName: "cloud.fill")
            default:
                self.imageWeather.image = UIImage(systemName: "nosign")
            }
        }
    }
}

extension WeatherViewController: UITextFieldDelegate {
     func textFieldDidEndEditing(_ textField: UITextField) {
        valueCity = textField.text ?? ""
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        feathWeather(city: valueCity)
        return true
    }
    
}

//
//  StartViewController.swift
//  HW_2.10
//
//  Created by User on 08.08.2021.
//

import UIKit
import Alamofire

class StartViewController: UIViewController{

    
    @IBOutlet weak var outletCityTF: UITextField!
    
    var nameCity: String = ""

    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherVC = segue.destination as? WeatherViewController else { return }
        weatherVC.valueCity = nameCity
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func nextButton() {
        view.endEditing(true)
//        if AF.validate() {
//            performSegue(withIdentifier: "weatherSeque", sender: nil)
//            outletCityTF.text = ""
//        }
//
//            }
    }
    
}

extension StartViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameCity = textField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nextButton()
        return true
    }
}


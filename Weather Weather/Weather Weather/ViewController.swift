//
//  ViewController.swift
//  Weather Weather
//
//  Created by Alan Hernandez on 6/30/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit
// 3d2c5e53e7a06856804df18e21e74898
//https://api.openweathermap.org/data/2.5/weather?q=London&appid=3d2c5e53e7a06856804df18e21e74898&units=imperial

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    @IBAction func didTapGo(){
        
        // have to guard if they dont type in a city
        guard cityTextField.text?.isEmpty == false else{return}
        
        
        //base url
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        // We're gonna make 3 components for the rem sectios in the URL
        let cityQuery = URLQueryItem(name: "q", value: cityTextField.text)
        let appIdQuery = URLQueryItem(name: "appid", value: "3d2c5e53e7a06856804df18e21e74898")
        
        let unitsQuery = URLQueryItem(name: "units", value: "imperial")
        
        
        // now were gonna chop up the url and paste them in we have to make an array to loop
        components?.queryItems = [cityQuery,appIdQuery,unitsQuery]
        //unwraping
        guard let url = components?.url else {return}
        // networking request
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            if let error = error{
                print(error)
            }
                else if let data = data {
                    do{
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
//                        print(json)
                        
                        //decodable way
                        let weatherReport = try JSONDecoder().decode(WeatherReport.self, from: data)
                        // more more print since we are passing it below
                        //print(weatherReport)
                        
                        self.performSegue(withIdentifier: "segue.Main.enterCityToWeather", sender: weatherReport)
                        
                    }
                    catch{
                        print(error)
                    }
                }
            }
    
        // use datatask after teh closure
        dataTask.resume()
        
        // to make sense of the weather report we have to create a struct or class to give it obejects to commincate with the next page
   
    }
    @IBAction func returnToMainVC(_ sender: UIStoryboardSegue){}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // we need to check for destinated to make sure we can pass data
        if let weatherVC = segue.destination as? WeatherVC, let weatherReport = sender as? WeatherReport {
            weatherVC.weatherReport =  weatherReport
        }
        
        
    }
    

}


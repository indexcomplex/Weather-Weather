//
//  WeatherVC.swift
//  Weather Weather
//
//  Created by Alan Hernandez on 6/30/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    
    @IBOutlet weak var cityLabel:UILabel! 
    @IBOutlet weak var weatherImage:UIImageView!
    @IBOutlet weak var temperatureLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    
    var weatherReport: WeatherReport!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // now that we have a weather object we have to make sure its unwrapped
        
        guard let weatherReport = weatherReport else {return}
        
        cityLabel.text = weatherReport.city
        temperatureLabel.text = weatherReport.degreesFahrenheit
        descriptionLabel.text = weatherReport.conditions.first?.description
        weatherImage.image = weatherReport.conditionImage
        
        
    }
    

    

}

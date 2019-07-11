//
//  WeatherReport.swift
//  Weather Weather
//
//  Created by Alan Hernandez on 7/1/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

//how to pull data from the JSON, not with dictionaries but with Decoable to make it fast

import Foundation
import UIKit

struct WeatherReport: Decodable{
    
    let city: String
    let breakdown: WeatherBreakdown
    let conditions: [WeatherCondition] // its an array bc thats how it is in the json we have to map it accordly
    
    private enum CodingKeys: String, CodingKey{
        case city = "name"
        case breakdown =  "main"
        case conditions = "weather"
    }
  
}

// extention

extension WeatherReport{
    
    var degreesFahrenheit: String{
    
        let wholeTemperature = Int(breakdown.temperature)
        let degreesFahrenheit = String(wholeTemperature) + "˚"
        return degreesFahrenheit
}

    
    var conditionImage: UIImage{
        
        guard let mainCondition = conditions.first else {return UIImage() }
        
        
        switch mainCondition.id {
            
        case 200...299: return #imageLiteral(resourceName: "thunder")
        case 300...399: return #imageLiteral(resourceName: "drizzle")
        case 500...599: return #imageLiteral(resourceName: "rain")
        case 600...699: return #imageLiteral(resourceName: "snow")
        case 700...799: return #imageLiteral(resourceName: "atmosphere")
        case 800      : return #imageLiteral(resourceName: "sunny")
        case 801...899: return #imageLiteral(resourceName: "cloudy")
        default: return UIImage()
        }
        
    }
    
    
    
    
}






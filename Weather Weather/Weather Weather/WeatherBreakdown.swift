 //
//  WeatherBreakdown.swift
//  Weather Weather
//
//  Created by Alan Hernandez on 7/8/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import Foundation

 struct WeatherBreakdown: Decodable{
    
    let temperature: Double
    
    
    private enum CodingKeys: String, CodingKey{
        case temperature = "temp"
        
        
        
    }
    
 }


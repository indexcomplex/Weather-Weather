//
//  WeatherReport.swift
//  Weather Weather
//
//  Created by Alan Hernandez on 7/1/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

//how to pull data from the JSON, not with dictionaries but with Decoable to make it fast

import Foundation

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

struct WeatherBreakdown: Decodable{
    
    let temperature: Double
    
    
    private enum CodingKeys: String, CodingKey{
        case temperature = "temp"
        
        
        
    }
    
}

struct WeatherCondition: Decodable{
    
    let id: Int
    let description: String
    // no private enums bc they're already named something we like
    
    
    
    
}





//
//  ViewController.swift
//  Weather Weather
//
//  Created by Alan Hernandez on 6/30/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    @IBAction func didTapGo(){
        
        performSegue(withIdentifier: "segue.Main.enterCityToWeather", sender: nil)
        
    }
    
    @IBAction func returnToMainVC(_ sender: UIStoryboardSegue){
        
        
    }
    
  

}


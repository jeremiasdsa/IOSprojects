//
//  CurrentWeather.swift
//  TempoApp
//
//  Created by jeremias araujo on 19/01/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather{
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType :String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    func downloadWeatherDetais(completed: @escaping DownloadComplete){
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType, "TIPO DO CLIMA ")
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String,AnyObject>{
                    if let currentTemp = main["temp"] as? Double{
                        let kelvinToCelcius = currentTemp - 273
                        self._currentTemp = Double(round(kelvinToCelcius))
                    
                    }
                }
                
//              print("dict?? \(dict)")
//              print(self.cityName)
//              print(self.currentTemp)
//              print(self.weatherType)
//              print(self.date)
             
            }
            
        }
        
        completed()
        
    }
    
}

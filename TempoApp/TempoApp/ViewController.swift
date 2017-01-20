//
//  ViewController.swift
//  TempoApp
//
//  Created by jeremias araujo on 19/01/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var dia: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weathernow: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var forecast: Forecast!
    
    var forecasts = [Forecast]()

    var biblioteca : Biblioteca!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.delegate = self
        tableview.dataSource = self
        
        biblioteca = Biblioteca()
        
        biblioteca.downloadBibliotecaData {
            //code
        }
       
        self.downloadForecastData {
            self.updateUI()
        }
   
            
        
        
         
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete){
//        let forecastURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String,AnyObject>]{
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
//                        print(obj)
                    }
                    
                    self.forecasts.remove(at: 0)
                    self.tableview.reloadData()
                }
            }
            completed()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            let forecast = forecasts[indexPath.row]
            
            cell.configureWcell(forecast: forecast)
            
            return cell
        }
        return WeatherCell()
    }

    
    func updateUI(){
        
        var _cityName: String!
        var _date: String!
        var _weatherType: String!
        var _currentTemp: Double!
//
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
            _date = "Today, \(currentDate)"
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
//
//        
//        func downloadWeatherDetais(completed: DownloadComplete){
        
            Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
                let result = response.result
                
                
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    
                    if let name = dict["name"] as? String {
                        _cityName = name.capitalized
                          self.city.text = cityName+" - PB"
                    }
                    
                    if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]{
                        if let main = weather[0]["main"] as? String{
                            _weatherType = main.capitalized
                            self.weathernow.text = weatherType
                            self.image.image = UIImage(named: weatherType)
                           
                        }
                    }
                    
                    if let main = dict["main"] as? Dictionary<String,AnyObject>{
                        if let currentTemp = main["temp"] as? Double{
                            let kelvinToCelcius = currentTemp - 273
                            _currentTemp = Double(round(kelvinToCelcius))
                            self.temperature.text = String(_currentTemp)+"°"
                            
                        }
                    }
                    
                    //              print("dict?? \(dict)")
//                    print(cityName)
//                    print(currentTemp)
//                    print(weatherType)
//                    print(date)
                    
                }
                
            }
            
//            completed()
//            
//        }
        
        
        
        
        print("________1")
     
        dia.text = date
//        print("________2")
//        print(currentWeather._cityName, currentWeather.currentTemp, currentWeather.date, currentWeather.weatherType)
//        
        
         print("________3")
        
    }

}


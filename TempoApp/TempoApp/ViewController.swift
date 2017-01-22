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

//    var biblioteca : Biblioteca!
    
    
    var currentweather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.delegate = self
        tableview.dataSource = self
        
//        biblioteca = Biblioteca()
        currentweather = CurrentWeather()
//        
//        biblioteca.downloadBibliotecaData {
//            //code
//        }
       
        self.downloadForecastData {
//            self.updateUI()
            self.currentweather.downloadWeatherDetais {
//                <#code#>
            }
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

    

}


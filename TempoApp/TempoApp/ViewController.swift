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
    
    var currentWeather = CurrentWeather()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.delegate = self
        tableview.dataSource = self
        
        print(CURRENT_WEATHER_URL)
        
        
//        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
        self.currentWeather.downloadWeatherDetais {
            //setup
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }


}


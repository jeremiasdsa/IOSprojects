//
//  WeatherCell.swift
//  TempoApp
//
//  Created by jeremias araujo on 20/01/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!

    
    
    func configureWcell(forecast: Forecast){
        self.imageIcon.image = UIImage(named : forecast.weatherType)
        self.dayLabel.text = forecast.date
        self.weatherType.text = forecast.weatherType
        self.highTemp.text = forecast.highTemp
        self.lowTemp.text = forecast.lowTemp
        
    }
    
            override func awakeFromNib() {
             
              
                super.awakeFromNib()
                // Initialization code
            }

            override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)
//                print("selected com sucesso", self)

                // Configure the view for the selected state
            }

}

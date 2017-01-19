//
//  Constants.swift
//  TempoApp
//
//  Created by jeremias araujo on 19/01/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="
let CITY = "Campina%20Grande"
let API_KEY = ",uk&appid=53e8b4a8ef6163aeffb053619054f74b"

typealias DownloadComplete = () -> ()


let CURRENT_WEATHER_URL = "\(BASE_URL)\(CITY)\(API_KEY)"

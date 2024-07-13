//
//  CurrentWeatherResult.swift
//  weatherApp
//
//  Created by 김윤홍 on 7/10/24.
//

import Foundation

struct CurrentWeatherResult: Codable {
  let weather: [Weather]
  let main: WeatherMain
}

struct Weather: Codable {
  let id: Int
  let main: String
  let description: String
  let icon: String
}

struct WeatherMain: Codable {
  let temp: String
  let tempMin: Double
  let tempMax: Double
  
  enum CodingKeys: String, CodingKey {
    case temp
    case tempMin = "temp_MIN"
    case tempMax = "temp_MAx"
  }
}

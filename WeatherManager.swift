//
//  WeatherData.swift
//  Clima
//
//  Created by MANEETH REDDY on 07/07/24.
//
//

import Foundation
import CoreLocation

protocol WeatherMangerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailwithError(error: Error)
}
struct WeatherManager {
    let weatherURL =
"https://api.openweathermap.org/data/2.5/weather?appid=825876b2cf6032573216f13975b8e82d&units=metric"
    
    var delegate: WeatherMangerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // -----*NETWORKING*------
        //1. Create a URL
        //2. Create a url session
        //3. Give A session a task
        //4. start the task
        
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a url session
            let session = URLSession(configuration: .default)
            //3. Give A session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                 if (error != nil) {
                     delegate?.didFailwithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                       
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
            }
            //4. start the task
            task.resume()
        
    }
    
    }
   func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
       performRequest(with: urlString)
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
           let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
//            print(decodedData.main.temp)
//            print(decodedData.weather[0].description)
//            print(decodedData.weather[0].id)
            let id = decodedData.weather[0].id // prints id
            let temp = decodedData.main.temp //prints temperature
            let name = decodedData.name  // prints name
            
            
           let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
//            print(weather.conditionName)
//            print(weather.temperatureString)
            
        } catch {
            delegate!.didFailwithError(error: error)
            return nil
        }
    }
    
    
}

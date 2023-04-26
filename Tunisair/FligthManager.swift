//
//  FligthManager.swift
//  Tunisair
//
//  Created by Mac on 26.04.23.
//

import Foundation
//import Alamofire
//
//// Replace YOUR_API_KEY with your actual Skyscanner API key
//let apiKey = "YOUR_API_KEY"
//let apiUrl = "https://partners.api.skyscanner.net/apiservices/browsequotes/v1.0"
//
//func searchFlights(from: String, to: String, date: String, completion: @escaping (_ result: [String: Any]?, _ error: Error?) -> Void) {
//    let parameters = ["apiKey": apiKey, "country": "US", "currency": "USD", "locale": "en-US", "originplace": from + "-sky", "destinationplace": to + "-sky", "outbounddate": date]
//
//    AF.request(apiUrl, parameters: parameters).responseJSON { response in
//        switch response.result {
//        case .success(let value):
//            if let json = value as? [String: Any] {
//                completion(json, nil)
//            } else {
//                completion(nil, nil)
//            }
//        case .failure(let error):
//            completion(nil, error)
//        }
//    }
//}
class FlightManager{
    let apiKey = "prtl6749387986743898559646983194"
    let apiUrl = "https://partners.api.skyscanner.net/apiservices/browsequotes/v1.0"
    func search(departure: String, arrival: String ){
       // let request = URLRequest(url: URL(string: apiUrl)!)
        guard var components = URLComponents(string: apiUrl) else { return }
       
        let parameters = ["apiKey": apiKey, "country": "US", "currency": "USD", "locale": "en-US", "originplace": departure + "-sky", "destinationplace": arrival + "-sky", "outbounddate": "26/05/2023"]
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(response)
            
        }.resume()
        
    }
    func searchFlights(from: String, to: String, date: String, completion: @escaping (_ result: [String: Any]?, _ error: Error?) -> Void) {
        var urlComponents = URLComponents(string: apiUrl)!
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "country", value: "US"),
            URLQueryItem(name: "currency", value: "USD"),
            URLQueryItem(name: "locale", value: "en-US"),
            URLQueryItem(name: "originplace", value: "\(from)-sky"),
            URLQueryItem(name: "destinationplace", value: "\(to)-sky"),
            URLQueryItem(name: "outbounddate", value: date)
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        completion(json, nil)
                    }
                } catch let error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
}

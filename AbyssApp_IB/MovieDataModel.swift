//
//  MovieDataModel.swift
//  AbyssApp_IB
//
//  Created by Ian Campbell Brothers on 3/18/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import Foundation
import UIKit

class MovieDataController: Codable{
    
    
    
    let JSONURL = "https://api.myjson.com/bins/1e5uji"
    var franchises: [franchise]
    var dataArray = ["Unexpected Data. Check URL."]
    var entryArray = ["Potato"]
    var starArray = ["William Shatner"]
    
    
    class franchise : Codable {
        let franchiseName: String
        let entries: [entries]
    }
    
    class entries : Codable {
        let name: String
        let format: String
        let yearStart: String
        let yearEnd: String
        let episodes: Int
        let network: String
        let imageURL: String
        let description: String
        let summary: String
        let starring: [starring]
    }
    
    class starring : Codable {
        let name: String
        let playing: String
    }
    
    func getData(completion: @escaping (_ success:Bool) -> ()) {
        var success = true
        let actualURL = URL(string: JSONURL)
        
        let task = URLSession.shared.dataTask(with: actualURL!) { (data,response,error) in
            
            if let _ = data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    if let movieArray = jsonObj!.value(forKey: "franchise") as?
                        Array<String> {
                        self.dataArray = movieArray
                        
                        print(jsonObj!.value(forKey: "franchise")!)
                    }
                }
            } else {
                success = false
            }
            completion(success)
        }
        task.resume()
    }
}

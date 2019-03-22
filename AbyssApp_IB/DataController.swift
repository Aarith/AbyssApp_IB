//
//  DataController.swift
//  AbyssApp_IB
//
//  Created by Ian Campbell Brothers on 3/22/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class DataController: NSObject {
    
    let JSONURL = "https://api.myjson.com/bins/1e5uji"
    var dataArray = ["Unexpected Data. Check URL."]
    var entryArray = ["Potato"]
    var starArray = ["William Shatner"]

    func getData(completion: @escaping (_ success:Data) -> ()) {
        var success = Data()
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
            }
            completion(success)
        }
        task.resume()
    }
}
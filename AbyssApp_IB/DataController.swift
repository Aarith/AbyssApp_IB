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
    var dataModel: Any?

    func getData(completion: @escaping (_ dataModel: MovieDataModel) -> ()) {
        var success = Data()
        let actualURL = URL(string: JSONURL)
        
        let task = URLSession.shared.dataTask(with: actualURL!) { (data,response,error) in
           
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder ()
                let mediaData = try decoder.decode(MovieDataModel.self, from: data)
                self.dataModel = mediaData
            }
            catch let err {
                print("Error", err)
            }
            DispatchQueue.main.async {
            completion(self.dataModel as! MovieDataModel)
            }
        }
        task.resume()
    }
}

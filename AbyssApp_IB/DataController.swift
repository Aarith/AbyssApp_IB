//
//  DataController.swift
//  AbyssApp_IB
//
//  Created by Ian Campbell Brothers on 3/22/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit

class DataController {
    
    let JSONURL = "https://api.myjson.com/bins/1e5uji"
   
    var dataModel = MovieDataModel()

    func getData(completion: @escaping (_ success: MovieDataModel) -> ()) {
        let actualURL = URL(string: JSONURL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: actualURL!) {(data,response,error) in
            
        if error != nil {
            return
        }
        
        guard let data = data else {
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let mediaData = try decoder.decode(MovieDataModel.self, from: data)
            self.dataModel = mediaData
        } catch {
            print(error)
            return
        }
        
        DispatchQueue.main.async{
            completion(self.dataModel as! MovieDataModel)
        }
    }
    task.resume()
    }
}

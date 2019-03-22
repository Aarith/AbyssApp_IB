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
    var franchises: [Franchises]
    var dataArray = ["Unexpected Data. Check URL."]
    var entryArray = ["Potato"]
    var starArray = ["William Shatner"]
    
    
    class Franchises : Codable {
        let franchiseName: String
        let entries: [Entries]
    }
    
    class Entries : Codable {
        let name: String
        let format: String
        let yearStart: String
        let yearEnd: String?
        let episodes: Int?
        let studio: String?
        let network: String?
        let imageURL: String
        let description: String
        let summary: String
        let starring: [starring]
    }
    
    class starring : Codable {
        let name: String
        let playing: String
    }
    
 
}

//
//  MovieDataModel.swift
//  AbyssApp_IB
//
//  Created by Ian Campbell Brothers on 3/18/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import Foundation
import UIKit

class MovieDataModel: Codable{
    
    var franchise: [Franchise] = []

}
    
    class Franchise : Codable {
        let franchiseName: String
        var entries: [Entries] = []
    }
    
    class Entries : Codable {
        let name: String
        let format: String
        let yearStart: String
        let yearEnd: String?
        let episodes: Int?
        let network: String?
        let imageURL: String?
        let description: String
        let summary: String
        var starring: [starring] = []
    }
    
    class starring : Codable {
        let name: String
        let playing: String
    }
    


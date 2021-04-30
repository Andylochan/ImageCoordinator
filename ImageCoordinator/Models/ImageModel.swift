//
//  ImageModel.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import Foundation

struct ImageModel {
    
    let imageID: String
    let imageTitle: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageID = "id"
        case imageTitle = "alt_description"
        case imageURL = "regular"
    }
}

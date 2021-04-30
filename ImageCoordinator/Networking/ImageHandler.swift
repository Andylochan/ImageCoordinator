//
//  ImageHandler.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class imageHandler {
    
    static let shared = imageHandler()
    
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Unsplash-Info", ofType: "plist") else {
                fatalError("Couldn't find the file 'Unsplash-Info.plist'.")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find 'API_KEY' in 'Unsplash-Info.plist'.")
            }
            
            return value
        }
    }

    func fetchImage(with queryParameter: String, closure: @escaping (Bool?, ImageModel?) -> Void) {
        
        let urlPrefix = "https://api.unsplash.com/photos/random/?query="
        let url = urlPrefix + queryParameter + apiKey
        
        AF.request(url, method: .get).responseJSON { response in
            
            if response.error != nil {
                closure(nil, nil)
                return
            }
            
            if let data = response.data {
                
                if let json = try? JSON(data: data) {
                    
                    let jsonObject  = json.dictionaryObject
                    let urlObject   = json.dictionaryValue["urls"]?.dictionaryObject?["regular"]
                    
                    let ObjId       = jsonObject?["id"] as? String ?? ""
                    let ObjTitle    = jsonObject?["alt_description"] as? String ?? ""
                    let ObjUrl      = urlObject as? String ?? ""
                    
                    let randomImage = ImageModel(imageID: ObjId, imageTitle: ObjTitle, imageURL: ObjUrl)
                    print(randomImage)
                    
                    closure(true, randomImage)
                }
            }
        }
    }
    
}

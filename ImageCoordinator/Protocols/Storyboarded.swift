//
//  Storyboarded.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

protocol Storyboarded {
    
    static func instantiate() -> Self
    
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        //Storyboard ID must match Class name
        let id = String(describing: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
        
    }
    
}

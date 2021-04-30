//
//  Coordinator.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var childCoordinator: [Coordinator] { get set }
    var navController: UINavigationController { get set }
    
    func start()
    
}

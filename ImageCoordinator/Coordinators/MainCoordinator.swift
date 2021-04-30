//
//  MainCoordinator.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinator = [Coordinator]()
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func dogVC() {
        let vc = DogViewController.instantiate()
        vc.coordinator = self
        navController.pushViewController(vc, animated: true)
    }

    func catVC() {
        let vc = CatViewController.instantiate()
        vc.coordinator = self
        navController.pushViewController(vc, animated: true)
    }
    
}

//
//  ViewController.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dogBtn: UIButton!
    @IBOutlet weak var catBtn: UIButton!
    
    @IBAction func dogBtnTapped(_ sender: UIButton) { coordinator?.dogVC() }
    @IBAction func catBtnTapped(_ sender: UIButton) { coordinator?.catVC() }
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleAnimation()
        
        dogBtn.layer.cornerRadius = dogBtn.layer.frame.height / CGFloat(K.Value.btnDiv)
        catBtn.layer.cornerRadius = catBtn.layer.frame.height / CGFloat(K.Value.btnDiv)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func titleAnimation() {
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = K.titleText
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
}

//MARK: - Capitalized Property
extension StringProtocol {
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

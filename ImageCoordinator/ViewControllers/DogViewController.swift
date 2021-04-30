//
//  DogViewController.swift
//  ImageCoordinator
//
//  Created by Andy Lochan on 11/16/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

class DogViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var newImgBtn: UIButton!
    
    @IBAction func newImgBtnTapped(_ sender: UIButton) {
        getImage(query: K.dogQuery)
    }
    
    weak var coordinator: MainCoordinator?
    private var pulledImage = ImageModel(imageID: "", imageTitle: "", imageURL: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(query: K.dogQuery)
        
        imgView.layer.cornerRadius = imgView.layer.frame.height / CGFloat(K.Value.imgViewDiv)
        newImgBtn.layer.cornerRadius = newImgBtn.layer.frame.height / CGFloat(K.Value.newBtnDiv)
        
    }
    
    private func getImage(query searchQuery: String) {
        imageHandler.shared.fetchImage(with: searchQuery) { [unowned self] (result, image) in
            if let res = result {
                self.pulledImage = image ?? self.pulledImage
                self.updateUI()
                print( res ? "Success" : "Error" )
            }
        }
    }
    
    private func updateUI() {
        guard let url = URL(string: pulledImage.imageURL) else { return }
        
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            imgView.image = UIImage(data: imageData)
        }
        
        descLbl.text = pulledImage.imageTitle.firstCapitalized
    }
    
}


//
//  DetailViewController.swift
//  PhotoViewer
//
//  Created by Ian Huettel on 4/5/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let foundImage = imageName {
            displayImage.image = UIImage(named: foundImage)
        }
    }

}

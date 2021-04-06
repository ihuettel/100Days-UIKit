//
//  DetailViewController.swift
//  PhotoViewer
//
//  Created by Ian Huettel on 4/5/21.
//

import UIKit

class DetailViewController: UIViewController {

    // Make a link to our Image View in Interface Builder, which will definitely always be here.
    @IBOutlet weak var displayImage: UIImageView!
    
    // Declare our properties as optionals, as we're defining them after initialization
    var imageName: String?
    var imageNum: Int?
    var imageCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title to it's number relative to the number of images
        // but if that fails, we just make it the name of the image
        // which is inherently optional, so if that fails, that's okay too.
        if let imageNum = imageNum, let imageCount = imageCount {
            title = "\(imageNum) of \(imageCount)"
        } else {
            title = imageName
        }
        
        // Make sure our large titles stay where they belong – not here
        navigationItem.largeTitleDisplayMode = .never
        
        // Make sure we have an image that matches the name, then associate it.
        if let foundImage = imageName {
            displayImage.image = UIImage(named: foundImage)
        }
    }
    
    
    // Set up the ability to hide the Navigation Bar by tapping the screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // Make sure we take away the ability to hide the Nav Bar when we want to leave
    // ...or else weird things might happen...
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}

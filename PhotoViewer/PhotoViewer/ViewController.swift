//
//  ViewController.swift
//  PhotoViewer
//
//  Created by Ian Huettel on 4/2/21.
//

import UIKit

class ViewController: UITableViewController {
    
    // Create an array of strings to hold our picture names
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define and design our title for the Table View Controller
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Declare a file manager to get our files
        let fm = FileManager.default
        // Define the path to our resource directory
        // This is force unwrapped, because if this fails,
        // we have much bigger problems.
        let path = Bundle.main.resourcePath!
        // Then use our file manager and path to actually get
        // an array of strings of all the file names from
        // the resource directory.
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Iterate through all the files and find the ones
        // that actually have the prefix of our images
        // to make sure we only get what we want.
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        // Sort them so they appear in alphanumerical order
        pictures.sort()
    }
    
    // Display the correct number of cells in our Table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Display our cells using reusable cells, naming them
    // according to the name we found for them in the resource path
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Conditionally make sure our view controller actually
        // can be found and interpreted as a DetailViewController
        // (aka our custom UIViewController class)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // If that's all good, define the 3 properties we left as optionals
            vc.imageName = pictures[indexPath.row]
            vc.imageNum = indexPath.row + 1
            vc.imageCount = pictures.count
            
            // Then we push it onto the view stack!
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}


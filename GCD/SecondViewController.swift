//
//  SecondViewController.swift
//  GCD
//
//  Created by Eugene on 19.01.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imageURL: URL?
    var image: UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Aerial_view_of_Apple_Park_dllu.jpg/1920px-Aerial_view_of_Apple_Park_dllu.jpg")
        let myQueue = DispatchQueue.global(qos: .utility)
        
        self.activityIndicator.startAnimating()
        
        myQueue.async { [unowned self] in
            print("pososi1")
            if let imageData = try? Data(contentsOf: imageURL!){
                print("pososi2")
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                    self.imageView.image = self.image
                    print("pososi3")
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

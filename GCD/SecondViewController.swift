//
//  SecondViewController.swift
//  GCD
//
//  Created by Eugene on 19.01.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageURL: URL?
    var image: UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    func fetchImage(){
        imageURL = URL(string: "https://ru.wikipedia.org/wiki/Apple#/media/%D0%A4%D0%B0%D0%B9%D0%BB:Aerial_view_of_Apple_Park_dllu.jpg")
        if let url = imageURL{
            do {
                let imageData = try Data(contentsOf: url)
                self.image = UIImage(data: imageData)
                print("daflasjdfjdas")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()
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

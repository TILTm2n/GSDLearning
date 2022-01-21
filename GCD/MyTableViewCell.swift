//
//  MyTableViewCell.swift
//  GCD
//
//  Created by Eugene on 21.01.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    func configure(with text: String){
        
        DispatchQueue.global().async {
            for i in 0 ..< 300_000{
                print(i)
            }
        }
        
        myImageView.image = UIImage(named: "mersedes")
        myLabel.text = text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

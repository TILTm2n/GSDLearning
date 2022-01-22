//
//  FirstViewController.swift
//  GCD
//
//  Created by Eugene on 21.01.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var dataSource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //myTableView.estimatedRowHeight = 100
        DataManager.obtainDataOperation { [weak self] (stringsArray) in
            self?.dataSource = stringsArray
            
            DispatchQueue.main.async {
                self?.myTableView.reloadData()
            }
            print("1")
        }
        print("2")
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
    }

}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
        
        cell.configure(with: dataSource[indexPath.row])
        
        return cell
    }
    
    
}

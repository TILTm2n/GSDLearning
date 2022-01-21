//
//  ViewController.swift
//  GCD
//
//  Created by Eugene on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class ConditionTest{
    private let condition = NSCondition()
    private var check: Bool = false
    
    func test1(){
        //закрываем ресурс
        condition.lock()
        while(!check){
            condition.wait()
        }
        condition.unlock()
    }
    
    func test2(){
        condition.lock()
        check = true
        condition.signal()
        condition.unlock()
    }
}


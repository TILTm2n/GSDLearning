//
//  DataManager.swift
//  GCD
//
//  Created by Eugene on 21.01.2022.
//

import Foundation

class DataManager{
    //функции помеченные class позволяют подклассам переопределять инструкции суперкласса этого метода
    class func obtainData(completion: @escaping (([String]) -> Void)){
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            
            //completion нужно возвращать в главном потоке
            DispatchQueue.main.async {
                completion(["hello","all","there","!"])
            }
        }
    }
}

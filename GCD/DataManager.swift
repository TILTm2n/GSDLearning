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
        
        var data = [String]()
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global(qos: .utility).async{
            data.append("all")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global().async{
            data.append("hello")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            data.append("there")
            data.append("!!!")
            group.leave()
        }
        
        //notify срабатывает когда количество входов равно количеству выходов
        group.notify(queue: .main) {
            completion(data)
        }
        
    }
}

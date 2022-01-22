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
    
    class func obtainDataOperation(completion: @escaping (([String]) -> Void)){
        
        var data = [String]()
        
        //OperationQueue отличается от DispatchQueue тем что создает параллельные очереди
        let operationQueue = OperationQueue()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let operationBlock1 = BlockOperation{
                for i in 0 ..< 5 {
                    data.append("\(i) - 🦊")
                    //print("🦊")
                }
            }
            
            let operationBlock2 = BlockOperation{
                for i in 0 ..< 5 {
                    data.append("\(i) - 🐋")
                    //print("🐋")
                }
            }
//
            let operationBlock3 = BlockOperation{
                for i in 0 ..< 5 {
                    data.append("\(i) - 🐇")
                    //print("White Rabbit 🐇")
                }
            }
            
            //эти зависимости означают то, что блок 3 выполнится после того как будут выполнены блок1 и блок2
//            operationBlock3.addDependency(operationBlock1)
//            operationBlock3.addDependency(operationBlock2)
            
            //ждет пока опреции завершатся
            operationQueue.addOperations([operationBlock1, operationBlock3], waitUntilFinished: true)
            
            completion(data)
        }
    }
}

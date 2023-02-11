//
//  GetRandomInt.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 11.02.2023.
//

final class GetRandomInt {
    var intValue: Int = 0
    let qNumArray = [0, 1, 2, 3, 4]
    var randomInt: [Int] = []
    
    init() {
        getRandomNumberQ()
    }
 
    func getRandomNumberQ() {
        let intArray = qNumArray
        let intSet = Set(intArray)
        randomInt = Array(intSet)
    }
    
    func counter() {
        if intValue == 4 {
            intValue += 1
        } else {
            intValue = 0
        }
    }
}

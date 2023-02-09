//
//  MainGameBrain.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import UIKit
 
struct MainGameBrain {
    var questionNumber = 0
    let intArray = [1, 2, 3, 4]
    var hallHelp: HallHelpModel?
    
    let quizMulti = [
        QuestionMulti(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine", "OMG testing"], correctAnswer: "2"),
        QuestionMulti(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100", "150"], correctAnswer: "3"),
        QuestionMulti(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time", "OMG testing"], correctAnswer: "2"),
        QuestionMulti(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet", "OMG testing"], correctAnswer: "1")
    ]
    
    func getQuestionText() -> String {
        return quizMulti[questionNumber].q
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quizMulti.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quizMulti[questionNumber].correctAnswer {
            return true
        } else {
            return false
        }
    }
    
    func getButtonTitle(with buttonNumber: Int) -> String {
        let stringValue = quizMulti[questionNumber].a[buttonNumber]
        return stringValue
    }
    //TODO: - отследить, нужен ли mutating
    mutating func promptFifryFifry(_ buttons: [UIButton]) {
        let twoNumberArray = fiftyFifty()
        
        buttons.forEach { element in
            if element.tag == twoNumberArray[0] || element.tag == twoNumberArray[1] {
                element.setTitle("", for: .normal)
            }
        }
    }
    
    mutating func fiftyFifty() -> [Int] {
        //выбираем два неправильных ответа
        var arrayQ = intArray
        let correctInt = getCorrectInt()
        
        arrayQ.enumerated().forEach { arrayIndex, arrayValue in
            if arrayValue == correctInt {
                arrayQ.remove(at: arrayIndex)
            }
        }
        
        guard let randomElement = arrayQ.randomElement() else { fatalError() }
        
        arrayQ.enumerated().forEach { arrayIndex, arrayValue in
            if arrayValue == randomElement {
                arrayQ.remove(at: arrayIndex)
            }
        }
        return arrayQ
    }
    
    mutating func hallHelpValues() {
        //делаем модель для отображения помощи зала
        let correctInt = getCorrectInt()
                
        switch correctInt {
        case 1:
            hallHelp = HallHelpModel(firstValue: 350, secondValue: 25, thirdValue: 75, fourthValue: 50)
        case 2:
            hallHelp = HallHelpModel(firstValue: 25, secondValue: 350, thirdValue: 75, fourthValue: 50)
        case 3:
            hallHelp = HallHelpModel(firstValue: 25, secondValue: 75, thirdValue: 350, fourthValue: 50)
        case 4:
            hallHelp = HallHelpModel(firstValue: 25, secondValue: 75, thirdValue: 50, fourthValue: 350)
        default:
            print("Omg Omg!!!")
        }
    }
    
    func callToFriend() -> Int {
        var arrayQ = intArray
        let correctInt = getCorrectInt()

        arrayQ.enumerated().forEach { arrayIndex, arrayValue in
            if arrayValue == correctInt {
                arrayQ.remove(at: arrayIndex)
            }
        }
        
        let correctArray = Array(repeating: correctInt, count: 80)
        let array1 = Array(repeating: arrayQ[0], count: 7)
        let array2 = Array(repeating: arrayQ[1], count: 7)
        let array3 = Array(repeating: arrayQ[2], count: 6)
        
        
        let finalArray = correctArray + array1 + array2 + array3
        print(finalArray)

        
        guard let callToFriendIntValue = finalArray.randomElement() else { fatalError() }
        return callToFriendIntValue
    }
    
    func forEachArray<T: UIView>(_ array: [T], _ value: Int, _ color: UIColor) {
        array.forEach { element in
            if element.tag == value {
                element.backgroundColor = color
            }
        }
    }
    
    func disableButton(_ sender: UIButton, _ imageName: String) {
        sender.setImage(UIImage(named: imageName), for: .normal)
        sender.isEnabled = false
    }
    
    func getCorrectInt() -> Int {
        guard let correctInt = Int(quizMulti[questionNumber].correctAnswer) else { fatalError() }
        return correctInt
    }
}

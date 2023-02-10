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
    
        let quiz = [
        Question(text: "Универсальные шаблоны помогают реализовать это", answer: ["Архитектуру", "Коллекции", "Переменные свойства", "Гибкие функции"], correctAnswer: "4"),
        Question(text: "Сколько способов обработки ошибок существует в Swift?", answer: ["2", "4", "1", "3"], correctAnswer: "2"),
        Question(text: "Обработка ошибок, это процесс ...?", answer: ["Реагирования на ошибки", "Прогнозирования ошибок", "Хранения ошибок", "Генерации ошибок"], correctAnswer: "1"),
        Question(text: "Как называется класс, у которого наследуют?", answer: ["Наследник", "Класс", "Подкласс", "Суперкласс"], correctAnswer: "4"),
        Question(text: "Если String пустая, то startIndex и endIndex будут ...?", answer: ["Пустыми", "nil", "Неравными", "Равными"], correctAnswer: "4"),
        Question(text: "Как традиционно называют экземпляр класса в ООП?", answer: ["Экземпляр", "Структура", "Объект", "Таргет"], correctAnswer: "3"),
        Question(text: "Что из перечисленного является ссылочным типом?", answer: ["Свойства", "Структуры", "Классы", "Перечисления"], correctAnswer: "3"),
        Question(text: "Можно ли сравнивать две строки?", answer: ["Нет", "Да", "Только !=", "Только =="], correctAnswer: "2"),
        Question(text: "Как пишется сокращенная форма записи массива в Swift?", answer: ["Array<ElementType>", "Array(ElementType)[]", "[ElementType]", "[ElementType]()"], correctAnswer: "3"),
        Question(text: "Сколько основных типов коллекций обеспечивает Swift?", answer: ["3", "5", "2", "4"], correctAnswer: "1"),
        Question(text: "Сколько основных свойств имеет UIStackView?", answer: ["4", "3", "2", "1"], correctAnswer: "1"),
        Question(text: "Для каких типов доступны деинициализаторы?", answer: ["Типы перечислений", "Структурные типы", "Все перечисленные ", "Классовые типы"], correctAnswer: "4"),
        Question(text: "Чем разделяются протокола в композиции протоколов?", answer: [",", "&", "-", ":"], correctAnswer: "2"),
        Question(text: "Какой тип хранит только положительные целые числа?", answer: ["UInt", "Int", "Double", "Float"], correctAnswer: "1"),
        Question(text: "Являются ли Swift Array универсальными?", answer: ["Нет", "Только Dictionary", "Да", "Только Array"], correctAnswer: "3")
        ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            return true
        } else {
            return false
        }
    }
    
    func getButtonTitle(with buttonNumber: Int) -> String {
        let stringValue = quiz[questionNumber].answer[buttonNumber]
        return stringValue
    }
    
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
        guard let correctInt = Int(quiz[questionNumber].correctAnswer) else { fatalError() }
        return correctInt
    }
}

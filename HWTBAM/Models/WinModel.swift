//
//  WinModel.swift
//  HWTBAM
//
//  Created by Alexander Altman on 07.02.2023.
//

import UIKit

enum QSum: String {
    case one = "100"
    case two = "200"
    case three = "300"
    case four = "500"
    case five = "1 000"
    case six = "2 000"
    case seven = "4 000"
    case eight = "8 000"
    case nine = "16 000"
    case ten = "32 000"
    case eleven = "64 000"
    case twelve = "125 000"
    case thirteen = "250 000"
    case fourteen = "500 000"
    case fifteen = "1 000 000"
}

enum QNumber: String {
    case one = "Вопрос 1"
    case two = "Вопрос 2"
    case three = "Вопрос 3"
    case four = "Вопрос 4"
    case five = "Вопрос 5"
    case six = "Вопрос 6"
    case seven = "Вопрос 7"
    case eight = "Вопрос 8"
    case nine = "Вопрос 9"
    case ten = "Вопрос 10"
    case eleven = "Вопрос 11"
    case twelve = "Вопрос 12"
    case thirteen = "Вопрос 13"
    case fourteen = "Вопрос 14"
    case fifteen = "Вопрос 15"
}

struct WinModel {
    let prize: QSum
    let number: QNumber
    let backgroundcolorLabel: UIColor?
    let safeSum: String
}

extension WinModel {
    static var winModels: [WinModel] = [
        WinModel(prize: QSum.fifteen, number: QNumber.fifteen, backgroundcolorLabel: Theme.millionColor.withAlphaComponent(0.5), safeSum: "1 000 000"),
        WinModel(prize: QSum.fourteen, number: QNumber.fourteen, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: QSum.thirteen, number: QNumber.thirteen, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: QSum.twelve, number: QNumber.twelve, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: QSum.eleven, number: QNumber.eleven, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: QSum.ten, number: QNumber.ten, backgroundcolorLabel: Theme.safeSumColor.withAlphaComponent(0.5), safeSum: "32 000"),
        WinModel(prize: QSum.nine, number: QNumber.nine, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: QSum.eight, number: QNumber.eight, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: QSum.seven, number: QNumber.seven, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: QSum.six, number: QNumber.six, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: QSum.five, number: QNumber.five, backgroundcolorLabel: Theme.safeSumColor.withAlphaComponent(0.5), safeSum: "1 000"),
        WinModel(prize: QSum.four, number: QNumber.four, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: QSum.three, number: QNumber.three, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: QSum.two, number: QNumber.two, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0"),
        WinModel(prize: QSum.one, number: QNumber.one, backgroundcolorLabel: Theme.questionColor.withAlphaComponent(0.5), safeSum: "0")
    ]
}

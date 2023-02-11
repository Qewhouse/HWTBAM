//
//  LoseScreenViewController.swift
//  HWTBAM
//
//  Created by Fazil Jabbarov 11 on 08.02.2023.
//

import UIKit
import SwiftUI

class LoseScreenViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image 1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы проиграли!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Lose"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play Again", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .none
        stack.spacing = 10
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var winBrain = WinBrain()
    var mainGameBrain = MainGameBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayot()
        setConstraints()
        
        buttonTapped()
    }
    
//    func getSafeSum() {
//        subLabel.text = "Ваш выигрыш составил \(winBrain.getSafeSum(cellNumber: questionNumber)) рублей"
//    }
    
    func buttonTapped() {
        playAgainButton.addTarget(self, action: #selector(playAgainButtonTapped), for: .touchUpInside)
    }
    
    @objc func playAgainButtonTapped() {
        let viewController = MainGameViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
    
    private func setLayot() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(labelStackView)
        view.addSubview(playAgainButton)
        
        labelStackView.addArrangedSubview(mainLabel)
        labelStackView.addArrangedSubview(subLabel)
        
//        getSafeSum()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImageView.heightAnchor.constraint(equalToConstant: 225),
            logoImageView.widthAnchor.constraint(equalToConstant: 225),
            
            labelStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelStackView.heightAnchor.constraint(equalToConstant: 200),
            
            playAgainButton.heightAnchor.constraint(equalToConstant: 50),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
}


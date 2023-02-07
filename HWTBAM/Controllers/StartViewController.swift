//
//  ViewController.swift
//  HWTBAM
//
//  Created by Alexander Altman on 05.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image 1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = """
to Who wants
to be a Millionare ?
"""
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rulesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Rules", for: .normal)
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
    
    var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .none
        stack.spacing = 10
        stack.distribution = .equalCentering
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func buttonTapped() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)

    }
    
    @objc func startButtonTapped() {
        print("hello")
    }
    
    @objc func rulesButtonTapped() {
        let rulesVC = RulesViewController()
        rulesVC.modalPresentationStyle = .fullScreen
        present(rulesVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        buttonTapped()
    }
    
    private func setLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(labelStackView)
        view.addSubview(buttonStackView)
        
        labelStackView.addArrangedSubview(mainLabel)
        labelStackView.addArrangedSubview(subLabel)
        
        buttonStackView.addArrangedSubview(startButton)
        buttonStackView.addArrangedSubview(rulesButton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 225),
            logoImage.widthAnchor.constraint(equalToConstant: 225),
            
            labelStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelStackView.heightAnchor.constraint(equalToConstant: 200),
            
            buttonStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 100),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            rulesButton.widthAnchor.constraint(equalToConstant: 150),
            rulesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

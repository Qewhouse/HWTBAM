//
//  MainGameViewController.swift
//  HWTBAM
//
//  Created by Сергей Золотухин on 09.02.2023.
//

import UIKit

class MainGameViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "millionaireImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Here will be your question"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "question 5"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let questionCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000 RUB"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "guest"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let moneyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0000"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var answerAButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 1
        return button
    }()
    
    private lazy var answerBButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 2
        return button
    }()
    
    private lazy var answerCButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 3
        return button
    }()
    
    private lazy var answerDButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.clipsToBounds = true
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.tag = 4
        return button
    }()
    
    private let letterALabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 1
        return label
    }()
    
    private let letterBLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "B"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 2
        return label
    }()
    
    private let letterCLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "C"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 3
        return label
    }()
    
    private let letterDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "D"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.layer.cornerRadius = 25
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        label.clipsToBounds = true
        label.tag = 4
        return label
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var promptFiftyFiftyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "fiftyFifty"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapFiftyFiftyButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var promptHallHelpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "hallHelp"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapHallHelpButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var promptCallToFriendButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "callToFriend"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapCallToFriendButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let numberCostStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let loginMoneyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let answersBlockStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 35
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let lettersBlockStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 35
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = -5
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let promptStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 1
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var mainGameBrain = MainGameBrain()
    
    private lazy var labelArray: [UILabel] = [letterALabel,
                                              letterBLabel,
                                              letterCLabel,
                                              letterDLabel
    ]
    private lazy var buttonsArray: [UIButton] = [answerAButton,
                                                 answerBButton,
                                                 answerCButton,
                                                 answerDButton
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        updateUI()
    }
    
    func setupLoginLabel(_ name: String) {
        loginLabel.text = name
    }
    
    func setupMoneyLabel(_ bablo: String) {
        moneyLabel.text = bablo
    }
    
    @objc
    private func didTapAnswerButton(_ sender: UIButton) {
        let userAnswer = sender.tag
        let userGotItRight = mainGameBrain.checkAnswer(userAnswer: String(userAnswer))
        
        if userGotItRight {
            let index = mainGameBrain.questionNumber
            
            sender.backgroundColor = UIColor.green
            mainGameBrain.forEachArray(labelArray, sender.tag, .green)
            
            let viewController = WiningViewController()
            viewController.setIndex(mainGameBrain.numberArray[index])
            viewController.playerAnswer = PlayerAnswer(question: mainGameBrain.questionNumberArray[index], result: true)
            
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: false)
            
        } else {
            sender.backgroundColor = UIColor.red
            mainGameBrain.forEachArray(labelArray, sender.tag, .red)
            
            let viewController = LoseScreenViewController()
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: false)
        }
        
//        mainGameBrain.nextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.updateUI()
        }
    }
    
    @objc
    private func didTapFiftyFiftyButton(_ sender: UIButton) {
        mainGameBrain.promptFifryFifry(buttonsArray)
        mainGameBrain.disableButton(sender, "redCrossFiftyFifty")
    }
    
    @objc
    private func didTapHallHelpButton(_ sender: UIButton) {
        mainGameBrain.hallHelpValues()
        guard let hallHelp = mainGameBrain.hallHelp else { fatalError() }

        mainGameBrain.disableButton(sender, "redCrossHallHelp")

        let viewController = HallHelpViewController()
        viewController.setupHallHelp(with: hallHelp)
        present(viewController, animated: false)
    }
    
    @objc
    private func didTapCallToFriendButton(_ sender: UIButton) {
        let randomValue = mainGameBrain.callToFriend()

        mainGameBrain.forEachArray(buttonsArray, randomValue, .orange)
        mainGameBrain.forEachArray(labelArray, randomValue, .orange)
        mainGameBrain.disableButton(sender, "redCrossCallToFriend")
    }
}

private extension MainGameViewController {
    func updateUI() {
        questionLabel.text = mainGameBrain.getQuestionText()
        
        letterALabel.backgroundColor = UIColor.blue
        letterBLabel.backgroundColor = UIColor.blue
        letterCLabel.backgroundColor = UIColor.blue
        letterDLabel.backgroundColor = UIColor.blue
        
        answerAButton.backgroundColor = UIColor.blue
        answerAButton.setTitle(mainGameBrain.getButtonTitle(with: 0), for: .normal)
        
        answerBButton.backgroundColor = UIColor.blue
        answerBButton.setTitle(mainGameBrain.getButtonTitle(with: 1), for: .normal)
        
        answerCButton.backgroundColor = UIColor.blue
        answerCButton.setTitle(mainGameBrain.getButtonTitle(with: 2), for: .normal)
        
        answerDButton.backgroundColor = UIColor.blue
        answerDButton.setTitle(mainGameBrain.getButtonTitle(with: 3), for: .normal)
    }
    
    func setupViewController() {
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        view.addSubview(backgroundImageView)
        
        topStackView.addArrangedSubview(logoImageView)
        topStackView.addArrangedSubview(questionLabel)
        
        numberCostStackView.addArrangedSubview(questionNumberLabel)
        numberCostStackView.addArrangedSubview(questionCostLabel)
        
        loginMoneyStackView.addArrangedSubview(loginLabel)
        loginMoneyStackView.addArrangedSubview(moneyLabel)
        
        answersBlockStackView.addArrangedSubview(answerAButton)
        answersBlockStackView.addArrangedSubview(answerBButton)
        answersBlockStackView.addArrangedSubview(answerCButton)
        answersBlockStackView.addArrangedSubview(answerDButton)
        
        lettersBlockStackView.addArrangedSubview(letterALabel)
        lettersBlockStackView.addArrangedSubview(letterBLabel)
        lettersBlockStackView.addArrangedSubview(letterCLabel)
        lettersBlockStackView.addArrangedSubview(letterDLabel)
        
        centerStackView.addArrangedSubview(lettersBlockStackView)
        centerStackView.addArrangedSubview(answersBlockStackView)
        
        promptStackView.addArrangedSubview(promptFiftyFiftyButton)
        promptStackView.addArrangedSubview(promptHallHelpButton)
        promptStackView.addArrangedSubview(promptCallToFriendButton)
        
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(numberCostStackView)
        mainStackView.addArrangedSubview(loginMoneyStackView)
        mainStackView.addArrangedSubview(topView)
        mainStackView.addArrangedSubview(centerStackView)
        mainStackView.addArrangedSubview(bottomView)
        mainStackView.addArrangedSubview(promptStackView)
        
        view.addSubview(mainStackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 87),
            logoImageView.heightAnchor.constraint(equalToConstant: 87),
            
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 120),
            
            numberCostStackView.heightAnchor.constraint(equalToConstant: 30),
            
            lettersBlockStackView.widthAnchor.constraint(equalToConstant: 40),
            
            centerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            centerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            centerStackView.heightAnchor.constraint(equalToConstant: 310),
            
            topView.heightAnchor.constraint(equalToConstant: 90),
            
            bottomView.heightAnchor.constraint(equalToConstant: 80),
            
            promptStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promptStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            promptStackView.heightAnchor.constraint(equalToConstant: 81)
        ])
    }
}


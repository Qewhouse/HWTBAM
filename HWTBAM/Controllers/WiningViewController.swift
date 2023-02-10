import UIKit

final class WiningViewController: UIViewController {

    var playerAnswer: PlayerAnswer?
    private var answerModel: AnswerModel?
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background")
        return image
    }()

    private let headerImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image 1")
        return image
    }()

    private let moneyList: UITableView = {
        let tableView = UITableView()
        tableView.register(WiningTableViewCell.self, forCellReuseIdentifier: WiningTableViewCell.id)
        tableView.backgroundColor = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let moneyArray = ["100", "200", "300", "500", "1 000", "2 000", "4 000", "8 000", "16 000", "32 000", "64 000", "125 000", "250 000", "500 000", "1 000 000"]
    var index = 0
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraint()
    }
    
    func setIndex(_ value: Int) {
        index = value
    }
    
    private func addTaps() {
            let tapScreen = UITapGestureRecognizer(target: self, action: #selector(viewTaps))
            tapScreen.cancelsTouchesInView = false
            view.addGestureRecognizer(tapScreen)
        }
        
        @objc private func viewTaps() {
            let upperIndex = index + 1
            let mainVC = MainGameViewController()
            mainVC.mainGameBrain.nextQuestion(upperIndex)
            mainVC.setupMoneyLabel(moneyArray[index])
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: false)
        }
    
    func setupLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(headerImage)
        view.addSubview(moneyList)
        moneyList.dataSource = self
        moneyList.delegate = self
        addTaps()
    }
}

extension WiningViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WinModel.winModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WiningTableViewCell.id, for: indexPath) as? WiningTableViewCell
        let currentQuestion = playerAnswer?.question == indexPath.row && playerAnswer?.result != nil
        cell?.configure(model: WinModel.winModels[indexPath.row], currentQuestion: currentQuestion)
        return cell ?? UITableViewCell()
    }
}

extension WiningViewController {
    func setupConstraint() {
        NSLayoutConstraint.activate([

            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            headerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImage.widthAnchor.constraint(equalToConstant: 130),
            headerImage.heightAnchor.constraint(equalToConstant: 130),

            moneyList.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 16),
            moneyList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moneyList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moneyList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


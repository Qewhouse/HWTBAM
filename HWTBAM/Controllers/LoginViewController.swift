import UIKit

class LoginViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background2")
        return image
    }()

    private let headerImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image 1")
        return image
    }()

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Введите имя"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = UIColor(named: "Blue")
        button.layer.cornerRadius = 12
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setConstraint()
    }

    func setupLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(headerImageView)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(loginButton)
    }
}

extension LoginViewController {
    func setConstraint() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImageView.widthAnchor.constraint(equalToConstant: 200),
            headerImageView.heightAnchor.constraint(equalToConstant: 200),

            loginLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 36),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -76),
            loginTextField.heightAnchor.constraint(equalToConstant: 48),

            loginButton.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 36),
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -76)
        ])
    }
}

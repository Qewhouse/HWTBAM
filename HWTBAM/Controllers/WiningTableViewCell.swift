import UIKit

class WiningTableViewCell: UITableViewCell {

    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "blueBackground")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Вопрос"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let prizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Деньги"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
        setupConstraint()
    }

    func setupLayout() {
        contentView.addSubview(backgroundImage)
        contentView.addSubview(questionLabel)
        contentView.addSubview(prizeLabel)
        self.backgroundColor = .clear
    }
}

extension WiningTableViewCell {
    func setupConstraint() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -42),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

            questionLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -20),

            prizeLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            prizeLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 20),
            prizeLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -20),
        ])
    }
}

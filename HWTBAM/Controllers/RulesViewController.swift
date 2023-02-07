import UIKit

class RulesViewController: UIViewController {

    //MARK: - UI Elements
    var scrollView: UIScrollView = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let rulesHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()

    private let rulesTextLabel: UILabel = {
        let label = UILabel()
        let rules = Rules()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .justified
        label.text = rules.rules
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let returnButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "green")
        button.tintColor = UIColor.white
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(clickReturn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
    }

    //MARK: - Layout
    func setLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(returnButton)
        view.addSubview(rulesHeadLabel)
        contentView.addSubview(rulesTextLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
   
    }
    
    @objc func clickReturn() {
        self.dismiss(animated: true)
    }
}

//MARK: - Constraints
extension RulesViewController {
    func setConstraint() {
        NSLayoutConstraint.activate([
            
            rulesHeadLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            rulesHeadLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: rulesHeadLabel.bottomAnchor, constant: 8),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: returnButton.topAnchor, constant: -20),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),



            rulesTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            rulesTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rulesTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rulesTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            returnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            returnButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            returnButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = RulesViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> RulesViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}

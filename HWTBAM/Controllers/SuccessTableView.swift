//
//  SuccessTableView.swift
//  HWTBAM
//
//  Created by Андрей Ветров on 05.02.2023.
//

import UIKit
import SwiftUI

struct SuccessTablePreview: UIViewControllerRepresentable {
    let viewControllerGenerator: () -> UIViewController

    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator()
    }

    func updateUIViewController(_ UIViewController: UIViewControllerType, context: Context) {

    }
}

class SuccessTableView: UIViewController {
    
    let gameLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gameLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

         
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        view.addSubview(gameLogoView)
    }


}

struct SuccessTableProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            SuccessTableView()
        }.edgesIgnoringSafeArea(.all)
    }
}

extension SuccessTableView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            gameLogoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            gameLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameLogoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            gameLogoView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            
         ])
    }

    
}

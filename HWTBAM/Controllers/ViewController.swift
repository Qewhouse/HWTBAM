//
//  ViewController.swift
//  HWTBAM
//
//  Created by Alexander Altman on 05.02.2023.
//

import UIKit
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
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


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}

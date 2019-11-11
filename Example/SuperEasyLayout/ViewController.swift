//
//  ViewController.swift
//  SuperEasyLayout
//
//  Created by doil6317 on 11/12/2019.
//  Copyright (c) 2019 doil6317. All rights reserved.
//

import UIKit
import SuperEasyLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "Super Easy Layout"
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textColor = .black

        let button = UIButton()
        button.setTitle("Awesome", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0

        view.addSubview(label)
        view.addSubview(button)

        label.left >= view.left + 10.0
        label.right <= view.right - 10.0
        label.centerX == view.centerX
        let topConstraint = label.top == view.topMargin + 10.0

        button.centerX == view.centerX
        button.width == view.width * 0.9
        button.top == label.bottom + 20.0
        button.height == 44.0

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            topConstraint.constant = 100.0
            UIView.animate(withDuration: 0.5) {
                self?.view.layoutIfNeeded()
            }
        }
    }
}


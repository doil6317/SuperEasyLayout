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
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Super Easy Layout"
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textColor = .black
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Awesome", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        return button
    }()

    private lazy var someLabel: UILabel = {
        let label = UILabel()
        label.text = "Very Long Long Long Long Text"
        return label
    }()

    private lazy var anotherLabel: UILabel = {
        let label = UILabel()
        label.text = "Also Long Long Long Long Text"
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(someLabel)
        view.addSubview(anotherLabel)
        view.addSubview(textField)

        label.left >= view.left + 16.0
        label.right <= view.right - 16.0
        label.centerX == view.centerX
        let topConstraint = label.top == view.topMargin + 24.0

        button.centerX == view.centerX
        button.width == view.width * 0.9
        button.width.setPriority(.defaultHigh) >= 500
        button.top == label.bottom + 24.0
        button.height == 44.0

        someLabel.left >= view.left + 16.0
        someLabel.top == button.bottom + 24.0

        anotherLabel.left >= someLabel.right + 16.0
        anotherLabel.right <= view.right - 16.0
        anotherLabel.lastBaseline == someLabel.lastBaseline
        anotherLabel.compressionRegistanceHorizontalPriority = .required

        textField.centerX == view.centerX
        textField.width == view.width * 0.9
        textField.bottom == view.keyboardLayoutGuide.top - 16
        textField.height == 44.0

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            topConstraint.constant = 100.0
            UIView.animate(withDuration: 0.5) {
                self?.view.layoutIfNeeded()
            }
        }
    }
}


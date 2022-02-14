//
//  AddNewWordsViewController.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 04.02.2022.
//

import Foundation
import UIKit

class AddNewWordsViewController: UIViewController {
    
    weak var delegate: WordsSavable?
    var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(done))
        return button
    }()
    var topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var topTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.layer.cornerRadius = 35
        text.adjustsFontSizeToFitWidth = true
        text.minimumFontSize = 25
        text.clipsToBounds = true
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.clearButtonMode = .always
        text.font = .systemFont(ofSize: 50, weight: .heavy)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    var bottomTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.layer.cornerRadius = 35
        text.adjustsFontSizeToFitWidth = true
        text.minimumFontSize = 25
        text.clipsToBounds = true
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.clearButtonMode = .always
        text.font = .systemFont(ofSize: 50, weight: .heavy)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = saveButton
        layout()
        
    }
    func layout() {
        view.addSubview(topView)
        view.addSubview(bottomView)
        view.addSubview(topTextField)
        view.addSubview(bottomTextField)
        
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        topView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.49).isActive = true
        
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.49).isActive = true
        
        topTextField.topAnchor.constraint(equalTo: topView.topAnchor, constant: 2).isActive = true
        topTextField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        topTextField.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 2).isActive = true
        topTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -2).isActive = true
        
        bottomTextField.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 2).isActive = true
        bottomTextField.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -2).isActive = true
        bottomTextField.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 2).isActive = true
        bottomTextField.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -2).isActive = true
        
        }
    @objc func done() {
        
        let newWords = WordsData(firstWord: String(topTextField.text ?? ""), secondWord: String(bottomTextField.text ?? ""))
        delegate?.save(newWords)
        navigationController?.popViewController(animated: true)
    }
}

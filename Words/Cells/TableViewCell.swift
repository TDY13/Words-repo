//
//  TableViewCell.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 04.02.2022.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {
    
    static let id = "TableViewCell-id"
    var firstWordLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var secondWordLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var leftView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var rightView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        addSubview(leftView)
        addSubview(rightView)
        leftView.addSubview(firstWordLabel)
        rightView.addSubview(secondWordLabel)
        
        leftView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        leftView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        leftView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        leftView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.47).isActive = true
        
        rightView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        rightView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        rightView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.47).isActive = true
        
        firstWordLabel.centerXAnchor.constraint(equalTo: leftView.centerXAnchor).isActive = true
        firstWordLabel.centerYAnchor.constraint(equalTo: leftView.centerYAnchor).isActive = true
        firstWordLabel.leftAnchor.constraint(equalTo: leftView.leftAnchor, constant: 4).isActive = true
        firstWordLabel.rightAnchor.constraint(equalTo: leftView.rightAnchor, constant: -4).isActive = true
        
        secondWordLabel.centerXAnchor.constraint(equalTo: rightView.centerXAnchor).isActive = true
        secondWordLabel.centerYAnchor.constraint(equalTo: rightView.centerYAnchor).isActive = true
        secondWordLabel.leftAnchor.constraint(equalTo: rightView.leftAnchor, constant: 4).isActive = true
        secondWordLabel.rightAnchor.constraint(equalTo: rightView.rightAnchor, constant: -4).isActive = true
        
        
        
    }
}

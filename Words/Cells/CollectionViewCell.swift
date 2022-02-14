//
//  CollectionViewCell.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 04.02.2022.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let id = "CollectionViewCell-id"
    var topLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var bottomLabel: UILabel = {
        var label = UILabel()
        label.isHidden = true
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var bigView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
//   Animation
//    override var isHighlighted: Bool {
//            didSet {
//                if isHighlighted {
//                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//                        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
//                    }, completion: nil)
//                } else {
//                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
//                    }, completion: nil)
//                }
//            }
//        }
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        backgroundColor = .clear
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        addSubview(bigView)
        bigView.addSubview(topLabel)
        bigView.addSubview(bottomLabel)
        
        bigView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bigView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bigView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        bigView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        topLabel.centerYAnchor.constraint(equalTo: bigView.centerYAnchor).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: bigView.centerXAnchor).isActive = true
        
        bottomLabel.centerXAnchor.constraint(equalTo: bigView.centerXAnchor).isActive = true
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30).isActive = true
    }
}


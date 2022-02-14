//
//  CollectionViewViewController.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 04.02.2022.
//

import Foundation
import UIKit

class CollectionViewViewController: UIViewController {
    
    var wordsList: [WordsData]?
    var updateData: (([WordsData]?) -> Void)?
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.sectionInset.left = 16
//        layout.sectionInset.right = 16
        layout.minimumLineSpacing = 0
        
        
        //        layout.minimumInteritemSpacing = 150
        //        layout.collectionView?.isSpringLoaded = true
        //        layout.collectionView?.isDirectionalLockEnabled = true
        //        layout.collectionView?.bouncesZoom = true
        //        layout.collectionView?.alwaysBounceHorizontal = true
        //        layout.collectionView?.semanticContentAttribute = .playback
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    weak var delegate: WordsSavable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        layout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateData?(wordsList)
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
    }
    
    private func reloadAll() {
        collectionView.reloadData()
    }
}

extension CollectionViewViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        wordsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        guard let wordsData = wordsList?[indexPath.row] else { return UICollectionViewCell() }
        cell.topLabel.text = wordsData.firstWord
        cell.bottomLabel.text = wordsData.secondWord
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var item = wordsList?[indexPath.item] else { return }
        
        let buff = item.firstWord
        
        item.firstWord = item.secondWord
        item.secondWord = buff
        
        wordsList?[indexPath.item] = item
        reloadAll()
        
    }
    
}

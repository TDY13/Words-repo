//
//  ViewController.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 04.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var wordsArray:[WordsData] = []
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    var designView: UIView = {
        var view = UIView()
        return view
    }()
    var addWordsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var learnWordsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "learn"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        addWordsButton.addTarget(self, action: #selector(addWords), for: .touchUpInside)
        learnWordsButton.addTarget(self, action: #selector(learnWords), for: .touchUpInside)
        layout()
        configureNavigationBar()
    }
   
    func configureNavigationBar() {
//        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Words list"
        navigationController?.navigationBar.prefersLargeTitles = true
        
}
    
    func layout() {
        view.addSubview(tableView)
        view.addSubview(addWordsButton)
        view.addSubview(designView)
        view.addSubview(learnWordsButton)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        
        addWordsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        addWordsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48).isActive = true
        addWordsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addWordsButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        learnWordsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        learnWordsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        learnWordsButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        learnWordsButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    @objc func addWords() {
       let vc = AddNewWordsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        print("The button was pressed")
    }
    
    @objc func learnWords() {
        let vc = CollectionViewViewController()
        vc.delegate = self
        vc.wordsList = wordsArray
        vc.updateData = { [weak self] updatedWords in
            self?.wordsArray = updatedWords ?? []
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentAntonyms(_ word: String, antonyms: [String]?) {
        guard let antonyms = antonyms, antonyms.count > 0 else { return }
        
        let alert = UIAlertController(title: "Antonyms for \"\(word)\"", message: antonyms.joined(separator: ", "), preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as? TableViewCell else {
            return UITableViewCell()}
        let wordsData = wordsArray[indexPath.row]
        cell.firstWordLabel.text = wordsData.firstWord
        cell.secondWordLabel.text = wordsData.secondWord
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            wordsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < wordsArray.count else { return }
        
        let selectedWord = wordsArray[indexPath.row]
        let firstSelectedWord = selectedWord.firstWord
        
        makeRequest(with: firstSelectedWord) { [weak self] antonyms in
            DispatchQueue.main.async {
                self?.presentAntonyms(firstSelectedWord, antonyms: antonyms)
            }
        }
    }
    
}
extension ViewController: WordsSavable {
    
    // Create new note
    func save(_ words: WordsData) {
        wordsArray.append(words)
        tableView.reloadData()
    }
    
    // Update existing note
    func update(_ updatedNote: WordsData, index: Int) {
        guard index < wordsArray.count else { return }
        wordsArray[index] = updatedNote
        tableView.reloadData()
        
        
    }
    
}


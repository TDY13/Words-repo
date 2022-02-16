//
//  ViewModel.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 15.02.2022.
//

import Foundation

func makeRequest(with word: String?, completion: @escaping ([String]?) -> Void) {
    guard let word = word else { return }

    let headers = [
         "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
         "x-rapidapi-key": "c96b0656b4mshfdf37114d8e9c66p11f299jsn19ce51a974bd"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)/antonyms")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        guard error == nil else {
            completion(nil)
            return
        }
        
        guard let data = data else {
            completion(nil)
            return
        }

        
        do {
            let wordsResponse = try JSONDecoder().decode(WordsResponse.self, from: data)
            completion(wordsResponse.antonyms)
        } catch let someError {
            print(someError)
        }
        
    }).resume()
}

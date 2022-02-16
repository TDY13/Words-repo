//
//  AntotymsRespons.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 15.02.2022.
//

import Foundation

struct WordsResponse: Codable {
    let word: String
    let antonyms: [String]?
}

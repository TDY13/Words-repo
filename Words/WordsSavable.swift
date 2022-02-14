//
//  WordsSavable.swift
//  Words
//

import UIKit
import Foundation

protocol WordsSavable: AnyObject {
     func save(_ words: WordsData)
     func update(_ updatedWords: WordsData, index: Int)
}

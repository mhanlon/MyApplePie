public struct ApplePieGame {
    var topRow: [Letter] = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    var middleRow: [Letter] = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    var bottomRow: [Letter] = ["Z", "X", "C", "V", "B", "N", "M"]
    
    public static let incorrectMovesAllowed = 7
    public static let wordList = ["swift", "enumerations", "optionals", "segues", "protocols"]
    
    let word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Letter] = []
    var formattedWord: String = ""
    
    mutating func select(_ letter: Letter) {
        guessedLetters.append(letter)
        if let letterIndex = topRow.firstIndex(of: letter) {
            topRow[letterIndex].selected = true
        }
        if let letterIndex = middleRow.firstIndex(of: letter) {
            middleRow[letterIndex].selected = true
        }
        if let letterIndex = bottomRow.firstIndex(of: letter) {
            bottomRow[letterIndex].selected = true
        }
        updateGuessedWord()
    }
    
    mutating func updateGuessedWord() {
        var guessedWord: String = ""
        let guessedLetters = guessedLetters.map {$0.lowerValue}
        for letter in word {
            if guessedLetters.contains(letter.lowercased()) {
                guessedWord.append(String(letter))
            } else {
                guessedWord.append("_")
            }
        }
        self.formattedWord = guessedWord
    }
}

public struct Letter: Hashable, ExpressibleByStringLiteral {
    let rawValue: String
    var characterValue: Character! {
        rawValue.first!
    }
    var lowerValue: String {
        rawValue.lowercased()
    }
    var selected = false
    
    public init(stringLiteral value: String) {
        self.rawValue = value
    }
}

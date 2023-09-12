import NaturalLanguage

let text = "You might not think that programmers are artists, but programming is an extremely creative profession. It is logic-based creativity"

let tagger = NLTagger(tagSchemes: [.tokenType])
tagger.string = text
tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .tokenType, options: [.omitWhitespace, .omitPunctuation]) { tag, range in
    print(text[range])
    return true
}

import NaturalLanguage

let text = "You might not think that programmers are artists, but programming is an extremely creative profession. It is logic-based creativity."

let tagger = NLTagger(tagSchemes: [.lexicalClass, .language, .script])
tagger.string = text
tagger.enumerateTags(in: text.startIndex..<text.endIndex,
                     unit: NLTokenUnit.word,
                     scheme: NLTagScheme.lexicalClass,
                     options: [.omitWhitespace,.omitPunctuation]) {
                    (tag, range) -> Bool in
                        print(text[range])
                        print(tag?.rawValue ?? "unknown")
                        print("\n")
                        return true
                    }


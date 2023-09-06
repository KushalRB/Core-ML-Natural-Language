import NaturalLanguage

let sampleText = "मेरो नाम कुशल हो।"


if let language = NLLanguageRecognizer.dominantLanguage(for: sampleText){
    print("Detected \(language.rawValue.uppercased()) as dominant language for \n\(sampleText)")
}else{
    print("Could not recognize language for \(sampleText)")
}

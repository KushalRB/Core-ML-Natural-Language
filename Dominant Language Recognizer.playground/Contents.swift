import NaturalLanguage

let sampleText = "मेरो नाम कुशल हो।"
let languageDictionary = []
let textArray = [
                "My name is Kushal",
                "मेरो नाम कुशल हो।",
                "il mio nome è Kushal",
                "私の名前はクシャルです",
                "ನನ್ನ ಹೆಸರು ಕುಶಾಲ್",
                "我的名字是库沙尔",
                "mi nombre es kushal",
                "je m'appelle Kushal",
                "میرا نام کشال ہے۔",
                "Mein Name ist Kushal"
                ]

for text in textArray{
    if let language = NLLanguageRecognizer.dominantLanguage(for: text){
        let langStr = Locale.current
        print("Detected \(language.rawValue.uppercased()) as dominant language for \n\(text)\n")
    }else{
        print("Could not recognize language for \(text)")
    }
}



import NaturalLanguage
import TabularData

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

if let fileURL = Bundle.main.url(forResource: "LanguageCodes", withExtension: "csv") {
    do {
        let languageDataframe = try DataFrame(contentsOfCSVFile: fileURL)
        print(languageDataframe)
        findDominantLanguage(languageDataframe: languageDataframe)
    } catch {
        print("Error: \(error)")
    }
} else {
    print("Error: Unable to locate the CSV file in the app's bundle.")
}


func findDominantLanguage(languageDataframe : DataFrame){
    for text in textArray{
        if let language = NLLanguageRecognizer.dominantLanguage(for: text){
            let detectedLanguage = languageDataframe.filter(on: "CODE", String.self, {$0 == language.rawValue})
            print(detectedLanguage.columns[1])
            print("Detected \(language.rawValue) as dominant language for \n\(text)\n")
        }else{
            print("Could not recognize language for \(text)")
        }
    }
}






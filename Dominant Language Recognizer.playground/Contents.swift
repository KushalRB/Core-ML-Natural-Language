import NaturalLanguage
import TabularData

//An array of strings whose dominant language is to be recognized
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


//Read the CSV file added to Resources folder
if let fileURL = Bundle.main.url(forResource: "LanguageCodes", withExtension: "csv") {
    do {
        //Convert the csv file to dataframe
        let languageDataframe = try DataFrame(contentsOfCSVFile: fileURL)
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
            let detectedLanguageDataFrame = languageDataframe.filter(on: "CODE", String.self, {$0 == language.rawValue})
            if let detectedLanguage = detectedLanguageDataFrame.columns[1].first as? String {
                print("Detected \(detectedLanguage) as dominant language for \n\(text)\n")
            } else {
                // The value is nil or not a String
                print("Language code is \(language.rawValue). Could not recognize language for \n\(text)\n")
            }
            
        }else{
            print("Could not recognize language for \(text)\n")
        }
    }
}






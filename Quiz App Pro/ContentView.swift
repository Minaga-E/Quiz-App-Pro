//
//  ContentView.swift
//  Quiz App Pro
//
//  Created by Minaga Ekanayake on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: Questions in Array:
    let questions = [
        Question(questionTitle: "What is this software called?", option1: "Python", option2: "Swift", option3: "SwiftUI", option4: "Xcode", correctOption: .four),
        Question(questionTitle: "What Language Does it use?", option1: "Java", option2: "SwiftUI", option3: "C+", option4: "C++", correctOption: .two)
    ]
    
    @State private var questionNumber: Int = 0
    
    @State private var isAlertPresented: Bool = false
    @State private var isCorrect: Bool = false
    
    @State private var numOfQuestionsCorrect : Int = 0
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 50) {
            ProgressView(value: Double(questionNumber), total: Double(questions.count))
                .animation(.easeInOut(duration: 2.0))
                .padding()
            Text(questions[questionNumber].questionTitle)
                .bold()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            
            VStack(spacing: 20){
 
                // MARK: Option 1 and 2
                HStack{
                    optionButton(optionNumber: .one, iconName: "triangle.fill")
                    optionButton(optionNumber: .two, iconName: "circle.fill")

                }
                .padding()
                // MARK: Option 3 and 4
                HStack{
                    optionButton(optionNumber: .four, iconName: "square.fill")
                    optionButton(optionNumber: .three, iconName: "diamond.fill")

                }
                .padding()
            }
        }
        .alert(isCorrect ? "Correct" : "Wrong", isPresented: $isAlertPresented){
            Button("Ok"){
                if questionNumber == questions.count - 1 {
                    isSheetPresented = true
                    questionNumber = 0
                } else {
                    questionNumber += 1
                    
                }
            }
        }message: {
            Text(isCorrect ? "Congrats! You are quite smart..." : "How can you be getting this wrong?!")
        }
        .sheet(isPresented: $isSheetPresented) { numOfQuestionsCorrect = 0} content: {
            ScoreView(score: numOfQuestionsCorrect, totalQuestions: questions.count)
        }

    }
    func optionButton(optionNumber : OptionChoice, iconName: String) -> some View {
        Button {
            didTapOption(optionNumber: optionNumber)
        } label: {
            Image(systemName: iconName)
            switch optionNumber {
            case .one:
                Text(questions[questionNumber].option1)
            case .two:
                Text(questions[questionNumber].option2)
            case .three:
                Text(questions[questionNumber].option3)
            case .four:
                Text(questions[questionNumber].option4)
            }
        }

    }
    
    func didTapOption(optionNumber : OptionChoice){
        if optionNumber == questions[questionNumber].correctOption{
            isCorrect = true
            numOfQuestionsCorrect += 1
            print("Correct Option!")
        }else {
            isCorrect = false
            print("Wrong Option!")
        }
        isAlertPresented = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

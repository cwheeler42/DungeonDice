//
//  ContentView.swift
//  DungeonDice
//
//  Created by Chris Wheeler on 2/25/25.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable, Identifiable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var id: Int {
            return rawValue
        }
        var description: String { "\(rawValue)-Sided".capitalized }
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    @State private var resultMessage = "Click to roll"
    @State private var animationTrigger = false     // changed when animation should occur
    @State private var isDoneAnimating = true
    
    var body: some View {
        
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(height: 150)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
//                .scaleEffect(isDoneAnimating ? 1.0 : 0.5)
//                .opacity(isDoneAnimating ? 1.0 : 0.2)
                .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0),
                                  axis: (x: 1, y: 0, z: 0))  // one full rotation on x-axis only
                .onChange(of: animationTrigger) {
                    isDoneAnimating = false     // set beginning state to false
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)) {
                        isDoneAnimating = true
                    }
                }
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
                ForEach(Dice.allCases) { die in
                    Button(die.description, action: {
                        resultMessage = "You rolled a \(die.roll()) on a \(die)-sided die"
                        animationTrigger.toggle()
                    })
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}

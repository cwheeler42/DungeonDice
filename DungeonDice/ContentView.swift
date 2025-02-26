//
//  ContentView.swift
//  DungeonDice
//
//  Created by Chris Wheeler on 2/25/25.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    @State private var label = "Click to roll"
    
    var body: some View {
        
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            Text(label)
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(height: 150)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Group {
                ForEach(Dice.allCases, id: \.self) { die in
                    Button("\(die)-Sided".capitalized, action: {
                        label = "You rolled a \(die.roll()) on a \(die)-sided die"
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

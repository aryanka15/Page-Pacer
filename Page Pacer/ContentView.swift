//
//  ContentView.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    let bookName = "Harry Potter and the Deathly Hallows"
    var body: some View {
        VStack {
            Text("Page Pacer")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            if verticalSizeClass == .compact {
                HStack {
                    BookInfoView(bookName: bookName)
                    TimerView(timerTime: 200)
                }
            }
            else {
                VStack {
                    BookInfoView(bookName: bookName)
                    Spacer()
                    TimerView(timerTime: 200)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

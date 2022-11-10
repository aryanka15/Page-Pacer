//
//  BookTimer.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/6/22.
//

import SwiftUI

struct BookTimer: View {
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    let book: Book
    
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            if verticalSizeClass == .compact {
                HStack {
                    BookInfoView(book: book)
                    TimerView(timerTime: 200)
                }
            }
            else {
                VStack {
                    BookInfoView(book: book)
                    Spacer()
                    TimerView(timerTime: 200)
                    Spacer()
                }
            }
        }
    }
}

struct BookTimer_Previews: PreviewProvider {
    static var previews: some View {
        BookTimer(book: Book(title: "Hello", pages: 900, author: "Hello2", ISBN: nil, published: nil))
            
    }
}

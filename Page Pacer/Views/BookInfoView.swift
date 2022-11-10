//
//  BookInfoView.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/5/22.
//

import SwiftUI

struct BookInfoView: View {
    
    let book: Book
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        
        let layout = verticalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        VStack {
            layout {
                Spacer()
                Text("Pages: " + String(book.pages))
                Spacer()
                Text("Remaining: " + String(book.pages - 800))
                Spacer()
                Text("Goal: 11/15/05")
                Spacer()
            }
        }
        .padding()
    }
}

struct BookInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BookInfoView(book: Book(title: "Hello", pages: 8000, author: "Hello 2", ISBN: nil, published: nil))
    }
}

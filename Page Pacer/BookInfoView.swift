//
//  BookInfoView.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/5/22.
//

import SwiftUI

struct BookInfoView: View {
    
    let bookName: String
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        
        let layout = verticalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        VStack {

            Text(bookName)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(5)
            layout {
                Spacer()
                Text("Pages: 1600")
                Spacer()
                Text("Remaining: 800")
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
        BookInfoView(bookName: "Harry Potter and the Deathly Hallows")
    }
}

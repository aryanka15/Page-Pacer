//
//  ContentView.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingPopover = false
    
    @State private var books = [Book(title: "Harry Potter", pages: 1500, author: "J.K. Rowling", ISBN: nil, published: nil), Book(title: "Dry", pages: 200, author: "Ryan Reynolds", ISBN: nil, published: nil)]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink(destination: BookTimer(book: book)) {
                        Text(book.title)
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingPopover = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(.white)
                    .background(.green, in: Circle())
                    .popover(isPresented: $showingPopover) {
                        VStack {
                            HStack {
                                Spacer()
                                Button {
                                    showingPopover = false
                                } label: {
                                    Image(systemName: "x.circle")
                            }
                            }
                            Spacer()
                        }
                        .padding()
            
                        Text("Popover here")
                            .font(.headline)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

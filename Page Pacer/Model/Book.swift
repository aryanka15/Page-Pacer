//
//  Book.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/8/22.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let pages: Int
    let author: String
    let ISBN: String?
    let published: Date?
}

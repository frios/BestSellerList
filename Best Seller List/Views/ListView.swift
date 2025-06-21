//
//  ListView.swift
//  NYT Best Sellers
//
//  Created by Ferdinand Rios on 2/23/21.
//

import SwiftUI

struct ListView: View {
    //MARK: - Variables and Constants
    
    var list: NYTList
    
    //MARK: - main view
    var body: some View {
        ZStack {
            List {
                ForEach (list.books, id: \.self) { book in
                    NavigationLink(value: book) {
                        ListItem(book: book)
                    }
                }
            }
            .navigationDestination(for: NYTBook.self) { book in
                BookDetail(book: book)
            }
            .navigationBarTitle(list.displayName, displayMode: .inline)
        }
    }
}

//
//  BuyOptionsButton.swift
//  BuyOptionsButton
//
//  Created by Ferdinand Rios on 8/5/21.
//

import SwiftUI

struct BuyOptionsButton: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @State private var buyingOptions = [NYTBuyLinks]()

    var book: NYTBook
    
    var body: some View {
        Menu {
            ForEach (0..<buyingOptions.count, id: \.self) {item in
                Link(buyingOptions[item].name, destination: URL(string: buyingOptions[item].url)!)
            }
        } label: {
            Text("Buy Options")
                .font(sizeClass == .compact ? .caption : .body)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .background(Capsule(style: .continuous))
                .frame(width: sizeClass == .compact ? 120 : 140)
        }
        
        .onAppear() {
            getBuyingOptions()
        }

    }
    
        
    //MARK: - Functions
    
    func getBuyingOptions() {
        buyingOptions.removeAll()
        let isbn10 = convertISBN13ToISBN10(book.primaryIsbn13)

        let amazon = NYTBuyLinks()
        amazon.name = "Amazon"
        amazon.url = "https://www.amazon.com/dp/\(isbn10)/ref=nosim?tag=\(AMAZON_ASSOCIATE_ID)"
        buyingOptions.append (amazon)
        
        let booksAMillion = NYTBuyLinks()
        booksAMillion.name = "Books-A-Million"
        booksAMillion.url = "https://www.tkqlhce.com/click-\(BooksAMillionAffiliateID)-42121?url=http%3A%2F%2Fwww.booksamillion.com%2Fp%2F\(isbn10)"
        buyingOptions.append (booksAMillion)

        let bookShop = NYTBuyLinks()
        bookShop.name = "Bookshop"
        bookShop.url = "https://bookshop.org/a/\(BookshopAffiliateID)/\(book.primaryIsbn13)"
        buyingOptions.append (bookShop)

        let indieBound = NYTBuyLinks()
        indieBound.name = "IndieBound"
        indieBound.url = "https://www.indiebound.org/book/\(book.primaryIsbn13)?aff=\(IndieBoundAffiliateID)"
        buyingOptions.append (indieBound)

    }
}


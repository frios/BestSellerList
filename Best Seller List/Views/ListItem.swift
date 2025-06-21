//
//  ListItem.swift
//  NYT Best Sellers
//
//  Created by Ferdinand Rios on 2/23/21.
//

import SwiftUI

struct ListItem: View {
    
    //MARK: - Variables and Constants

    var book: NYTBook

    //MARK: - Main Vuew
    var body: some View {
        HStack (alignment: .top) {
            RankView
            InfoView
            Spacer()
            VStack {
                BookImageView(book: book, width: bookSmallImageWidth, height: bookSmallImageHeight)
                BuyOptionsButton(book: book)
            }
        }
    }
    
    
    //MARK: - Sub Views
    
    var RankView: some View {
        VStack (alignment: .center, spacing: 10){
                Text("\(book.rank)")
                    .frame(width: 40, height: 34)
                    .font(Font.custom("Georgia", size: 34))
                    .foregroundColor(.gray)
                
                if book.rankLastWeek != 0 {
                    if book.rank < book.rankLastWeek {
                        Image(systemName: "arrow.up")
                            .font(.headline)
                            .foregroundColor(Color("upColor"))
                    } else if book.rank > book.rankLastWeek {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(Color("downColor"))
                    } else if book.rank == book.rankLastWeek {
                        Image(systemName: "slash.circle")
                            .font(.headline)
                            .foregroundColor(Color("staticColor"))
                    }
                } else {// new this week
                    Image(systemName: "exclamationmark")
                        .font(.headline)
                        .foregroundColor(Color("newColor"))
                }
            
            Spacer()
        }
        .padding(.trailing, 6)

        .alignmentGuide(.top) { d in
            return d[.top] + 8
        }
    }
    
    var InfoView: some View {
        VStack (alignment: .leading, spacing: 5) {
                if book.weeksOnList != 0 { //don't show weeks on list if this is a monthly display
                    if book.rankLastWeek != 0 {
                        Text(book.weeksOnList == 1 ? "\(book.weeksOnList) week on the list" : "\(book.weeksOnList) weeks on the list")
                            .foregroundColor(.gray)
                            .font(.caption)
                    } else {
                        Text("New this week")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
            
            
            Text("\(book.title)")
                .font(.headline)
            
            Text("by \(book.author) | \(book.publisher)")
                .font(.caption)
            
            HStack {
                if book.asterisk != 0 {
                    Text("*")
                }
                
                if book.dagger != 0 {
                    Text("†")
                }
            }
            .font(.headline)

            
            Text("\(book.nytDescription)")
                .font(Font.custom("Georgia", size: 12))
        }
    }
    

}


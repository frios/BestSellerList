//
//  BookDetail.swift
//  The Best Seller List
//
//  Created by Ferdinand Rios on 4/19/21.
//

import SwiftUI

struct BookDetail: View {
    //MARK: - Variables and Constants
    
    var book: NYTBook
    
    //MARK: - Main View
    
    var body: some View {
        ScrollView {
            AccreditationView
            AnnotationsView
            BookImage
            DescriptionView
                .padding(.horizontal)
            ReviewsView
        }
        .navigationBarTitle(book.title, displayMode: .inline)
    }
    
    
    //MARK: - Sub Views
    
    var AccreditationView: some View {
        HStack {
            VStack (alignment: .leading){
                Text("by \(book.author) | \(book.publisher)")
            }
            .foregroundColor(.gray)
            .font(.body)
            .padding(.leading)
            
            Spacer()
        }
    }
    
    var AnnotationsView: some View {
        HStack {
            if book.asterisk != 0 {
                Text("*")
            }
            if book.dagger != 0 {
                Text("†")
            }
            
            Spacer()
        }
        .foregroundColor(.gray)
        .font(.body )
        .padding(.leading)
    }
    
    var BookImage: some View {
        HStack (alignment: .top){
            BookImageView(book: book,
                          width: bookMediumImageWidth,
                          height: bookMediumImageHeight)
            
            VStack (alignment: .leading) {
                RankView
                BookInfoView
                AgeView
                Spacer()
                BuyOptionsButton(book: book)
                Spacer()
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding()
    }
    
    
    var RankView: some View {
        VStack (alignment: .leading){
            HStack {
                Text("#\(book.rank)")
                    .font(Font.custom("Georgia", size: 34))
                    .foregroundColor(.gray)
                
                if book.rankLastWeek != 0 {
                    if book.rank < book.rankLastWeek {
                        Image(systemName: "arrow.up")
                            .font(.title2)
                            .foregroundColor(Color("upColor"))
                    } else if book.rank > book.rankLastWeek {
                        Image(systemName: "arrow.down")
                            .font(.title2 )
                            .foregroundColor(Color("downColor"))
                    } else if book.rank == book.rankLastWeek {
                        Image(systemName: "slash.circle")
                            .font(.title2)
                            .foregroundColor(Color("staticColor"))
                    }
                } else {// new this week
                    Image(systemName: "exclamationmark")
                        .font(.title2)
                        .foregroundColor(Color("newColor"))
                }
            }
            
            if book.weeksOnList != 0 { //don't show weeks on list if this is a monthly display
                if book.rankLastWeek != 0 {
                    Text(book.weeksOnList == 1 ? "\(book.weeksOnList) week on the list" : "\(book.weeksOnList) weeks on the list")
                        .foregroundColor(.gray)
                        .font(.body)
                        .fixedSize()
                } else {
                    Text("New this week")
                        .foregroundColor(.gray)
                        .font(.body)
                }
            }
            
            Spacer()
        }
    }
    
    var BookInfoView: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("ISBN13: \(book.primaryIsbn13)")
        }
        .font(.caption2)
    }
    
    
    var AgeView: some View {
        VStack (alignment: .leading){
            if book.ageGroup != "" {
                Text(book.ageGroup)
                    .font(.caption2)
            }
        }
    }
    
    var DescriptionView: some View {
        Text("\(book.nytDescription)")
            .font(Font.custom("Georgia", size: 17))
    }
    
    
    var ReviewsView: some View {
        HStack {
            VStack (alignment: .leading) {
                if book.sundayReviewLink != "" /*|| book.bookReviewLink != "" || self.reviewInfo.numResults > 0*/ {
                    Text("Links:")
                        .fontWeight(.bold)
                }
                
                if book.sundayReviewLink != "" {
                    VStack (alignment: .leading) {
                        Text("Sunday review link: ")
                        Link(destination: URL(string: book.sundayReviewLink)!, label: {
                            Text(book.sundayReviewLink)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                        })
                    }
                }
                
                if book.bookReviewLink != "" {
                    VStack (alignment: .leading) {
                        Text("Book review link: ")
                        Link(destination: URL(string: book.bookReviewLink)!, label: {
                            Text(book.bookReviewLink)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                        })
                    }
                }
                
            }
            .font(.body)
            Spacer()
        }
        .padding()
    }
    
    
}

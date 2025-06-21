//
//  NYTOverviewResponse.swift
//  The Best Seller List
//
//  Created by Feldy Rios on 6/17/25.
//

import SwiftData

@Model
class NYTOverviewResponse: Decodable {
    var status : String
    var copyright : String
    var numResults : Int
    var results : NYTOverviewResult
    
    enum CodingKeys: CodingKey {
        case status
        case copyright
        case numResults
        case results
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent (String.self, forKey: .status) ?? ""
        copyright = try container.decodeIfPresent (String.self, forKey: .copyright) ?? ""
        numResults = try container.decodeIfPresent (Int.self, forKey: .numResults) ?? 0
        results = try container.decodeIfPresent(NYTOverviewResult.self, forKey: .results) ?? NYTOverviewResult()
    }
    
    init(status: String = "", copyright: String = "", numResults: Int = 0, results: NYTOverviewResult = NYTOverviewResult()) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
}

@Model
class NYTOverviewResult: Decodable {
    var publishedDate : String
    var previousPublishedDate : String
    var nextPublishedDate : String
    var lists : [NYTList]
    
    enum CodingKeys : CodingKey {
        case publishedDate
        case previousPublishedDate
        case nextPublishedDate
        case lists
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        publishedDate = try container.decodeIfPresent (String.self, forKey: .publishedDate) ?? ""
        previousPublishedDate = try container.decodeIfPresent (String.self, forKey: .previousPublishedDate) ?? ""
        nextPublishedDate = try container.decodeIfPresent (String.self, forKey: .nextPublishedDate) ?? ""
        lists = try container.decodeIfPresent([NYTList].self, forKey: .lists) ?? [NYTList]()
    }

    init(publishedDate: String = "", previousPublishedDate: String = "", nextPublishedDate: String = "", lists: [NYTList] = [NYTList]()) {
        self.publishedDate = publishedDate
        self.previousPublishedDate = previousPublishedDate
        self.nextPublishedDate = nextPublishedDate
        self.lists = lists
    }
}

@Model
class NYTList: Decodable {
    var displayName : String = ""
    var listNameEncoded : String = ""
    var updated : String = ""
    var books : [NYTBook]

    enum CodingKeys : CodingKey {
        case displayName
        case listNameEncoded
        case updated
        case books
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent (String.self, forKey: .displayName) ?? ""
        listNameEncoded = try container.decode (String.self, forKey: .listNameEncoded)
        updated = try container.decodeIfPresent (String.self, forKey: .updated) ?? ""
        books = try container.decodeIfPresent ([NYTBook].self, forKey: .books) ?? [NYTBook]()
    }

    init(displayName: String = "", listNameEncoded: String = "", updated: String = "", books: [NYTBook] = [NYTBook]()) {
        self.displayName = displayName
        self.listNameEncoded = listNameEncoded
        self.updated = updated
        self.books = books
    }
}

@Model
class NYTBook: Decodable {

    var rank : Int
    var rankLastWeek : Int
    var weeksOnList : Int
    var asterisk : Int
    var dagger : Int
    var primaryIsbn13 : String
    var publisher : String
    var nytDescription : String
    var title : String
    var author : String
    var contributor : String
    var bookImage : String
    var amazonProductUrl : String
    var ageGroup : String
    var bookReviewLink : String
    var sundayReviewLink : String

    enum CodingKeys: CodingKey {
        case rank
        case rankLastWeek
        case weeksOnList
        case asterisk
        case dagger
        case primaryIsbn13
        case publisher
        case description
        case title
        case author
        case contributor
        case bookImage
        case amazonProductUrl
        case ageGroup
        case bookReviewLink
        case sundayReviewLink
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rank = try container.decodeIfPresent (Int.self, forKey: .rank) ?? 0
        rankLastWeek = try container.decodeIfPresent (Int.self, forKey: .rankLastWeek) ?? 0
        weeksOnList = try container.decodeIfPresent (Int.self, forKey: .weeksOnList) ?? 0
        asterisk = try container.decodeIfPresent (Int.self, forKey: .asterisk) ?? 0
        dagger = try container.decodeIfPresent (Int.self, forKey: .dagger) ?? 0
        primaryIsbn13 = try container.decodeIfPresent (String.self, forKey: .primaryIsbn13) ?? ""
        publisher = try container.decodeIfPresent (String.self, forKey: .publisher) ?? ""
        nytDescription = try container.decodeIfPresent (String.self, forKey: .description) ?? ""
        title = try container.decodeIfPresent (String.self, forKey: .title) ?? ""
        author = try container.decodeIfPresent (String.self, forKey: .author) ?? ""
        contributor = try container.decodeIfPresent (String.self, forKey: .contributor) ?? ""
        bookImage = try container.decodeIfPresent (String.self, forKey: .bookImage) ?? "DefaultBookImage"
        amazonProductUrl = try container.decodeIfPresent (String.self, forKey: .amazonProductUrl) ?? ""
        ageGroup = try container.decodeIfPresent (String.self, forKey: .ageGroup) ?? ""
        bookReviewLink = try container.decodeIfPresent (String.self, forKey: .bookReviewLink) ?? ""
        sundayReviewLink = try container.decodeIfPresent (String.self, forKey: .sundayReviewLink) ?? ""
    }
    
    init(rank: Int = 0, rankLastWeek: Int = 0, weeksOnList: Int = 0, asterisk: Int = 0, dagger: Int = 0, primaryIsbn13: String = "", publisher: String = "", description: String = "", title: String = "", author: String = "", contributor: String = "", bookImage: String = "", amazonProductUrl: String = "", ageGroup: String = "", bookReviewLink: String = "", sundayReviewLink: String = "") {
        self.rank = rank
        self.rankLastWeek = rankLastWeek
        self.weeksOnList = weeksOnList
        self.asterisk = asterisk
        self.dagger = dagger
        self.primaryIsbn13 = primaryIsbn13
        self.publisher = publisher
        self.nytDescription = description
        self.title = title
        self.author = author
        self.contributor = contributor
        self.bookImage = bookImage
        self.amazonProductUrl = amazonProductUrl
        self.ageGroup = ageGroup
        self.bookReviewLink = bookReviewLink
        self.sundayReviewLink = sundayReviewLink
    }
    
    static var sampleData = [NYTBook(rank: 1, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 2, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 3, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 4, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 5, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 6, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 7, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 8, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 9, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 10, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 11, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 12, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 13, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 14, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com"), NYTBook(rank: 15, rankLastWeek: 2, weeksOnList: 2, asterisk: 1, dagger: 1, primaryIsbn13: "1111111111111", publisher: "River's Mind", description: "As dust storms roll during the Great Depression, Elsa must choose between saving the family and farm or heading West.", title: "This is the book's long title", author: "Kristin Hannah", contributor: "Tani E. Perez", bookImage: "DefaultBookImage", amazonProductUrl: "", ageGroup: "All ages", bookReviewLink: "https://labs.viciouscircle.com", sundayReviewLink: "https://labs.viciouscircle.com")]

    
}

class NYTBuyLinks: Codable {
    var name = ""
    var url = ""
}

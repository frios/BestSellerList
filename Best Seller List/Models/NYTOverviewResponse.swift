//
//  NYTOverviewResponse.swift
//  The Best Seller List
//
//  Created by Feldy Rios on 6/17/25.
//

import SwiftData


@Model
class NYTOverviewResponse: Codable {
    var status : String
    var copyright : String
    var numResults : Int
    var results: NYTOverviewResult
    
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(copyright, forKey: .copyright)
        try container.encode(numResults, forKey: .numResults)
        try container.encode(results, forKey: .results)
    }
}

@Model
class NYTOverviewResult: Codable {
    var previousPublishedDate : String
    var publishedDate : String
    var nextPublishedDate : String
    var publishedDateDescription : String
    var bestsellersDate: String
    var lists: [NYTList]
    var monthlyURI: String
    var weeklyURI: String

    enum CodingKeys: CodingKey {
        case previousPublishedDate
        case publishedDate
        case nextPublishedDate
        case publishedDateDescription
        case bestsellersDate
        case lists
        case monthlyURI
        case weeklyURI
    }

    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        previousPublishedDate = try container.decodeIfPresent (String.self, forKey: .previousPublishedDate) ?? ""
        publishedDate = try container.decodeIfPresent (String.self, forKey: .publishedDate) ?? ""
        nextPublishedDate = try container.decodeIfPresent (String.self, forKey: .nextPublishedDate) ?? ""
        
        publishedDateDescription = try container.decodeIfPresent (String.self, forKey: .publishedDateDescription) ?? ""
        bestsellersDate = try container.decodeIfPresent (String.self, forKey: .bestsellersDate) ?? ""
        monthlyURI = try container.decodeIfPresent (String.self, forKey: .monthlyURI) ?? ""
        weeklyURI = try container.decodeIfPresent (String.self, forKey: .weeklyURI) ?? ""

        lists = try container.decodeIfPresent([NYTList].self, forKey: .lists) ?? [NYTList]()
    }

    init(previousPublishedDate: String = "", publishedDate: String = "", nextPublishedDate: String = "", publishedDateDescription : String = "", bestsellersDate : String = "", monthlyURI: String = "", weeklyURI: String = "", lists: [NYTList] = [NYTList]()) {
        self.previousPublishedDate = previousPublishedDate
        self.publishedDate = publishedDate
        self.nextPublishedDate = nextPublishedDate
        self.publishedDateDescription = publishedDateDescription
        self.bestsellersDate = bestsellersDate
        self.monthlyURI = monthlyURI
        self.weeklyURI = weeklyURI
        self.lists = lists
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(previousPublishedDate, forKey: .previousPublishedDate)
        try container.encode(publishedDate, forKey: .publishedDate)
        try container.encode(nextPublishedDate, forKey: .nextPublishedDate)
        try container.encode(publishedDateDescription, forKey: .publishedDateDescription)
        try container.encode(bestsellersDate, forKey: .bestsellersDate)
        try container.encode(monthlyURI, forKey: .monthlyURI)
        try container.encode(weeklyURI, forKey: .weeklyURI)
        try container.encode(lists, forKey: .lists)
    }
}

@Model
class NYTList: Codable {
    var displayName: String
    var listName: String
    var listNameEncoded: String
    var lastUpdated : String  // <---- here, do not use "updated"
    var listId: Int
    var uri: String
    var books: [NYTBook]

    enum CodingKeys: String, CodingKey {
        case displayName
        case listName
        case listNameEncoded 
        case lastUpdated = "updated"  // <---- here
        case listId
        case uri
        case books
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent (String.self, forKey: .displayName) ?? ""
        listName = try container.decodeIfPresent (String.self, forKey: .listName) ?? ""
        listNameEncoded = try container.decodeIfPresent (String.self, forKey: .listNameEncoded) ?? ""
        lastUpdated = try container.decodeIfPresent (String.self, forKey: .lastUpdated) ?? ""  // <---- here
        listId = try container.decodeIfPresent (Int.self, forKey: .listId) ?? 0
        uri = try container.decodeIfPresent (String.self, forKey: .uri) ?? ""
        books = try container.decodeIfPresent ([NYTBook].self, forKey: .books) ?? [NYTBook]()
    }

    init(displayName: String = "", listName: String = "", listNameEncoded: String = "", lastUpdated: String = "", listId: Int = 0, uri: String = "", books: [NYTBook] = [NYTBook]()) {
        self.displayName = displayName
        self.listName = listName
        self.listNameEncoded = listNameEncoded
        self.lastUpdated = lastUpdated  // <---- here
        self.listId = listId
        self.uri = uri
        self.books = books
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(listName, forKey: .listName)
        try container.encode(listNameEncoded, forKey: .listNameEncoded)
        try container.encode(lastUpdated, forKey: .lastUpdated)  // <---- here
        try container.encode(listId, forKey: .listId)
        try container.encode(uri, forKey: .uri)
        try container.encode(books, forKey: .books)
    }
    
}

@Model
class NYTBook: Codable {

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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rank, forKey: .rank)
        try container.encode(rankLastWeek, forKey: .rankLastWeek)
        try container.encode(weeksOnList, forKey: .weeksOnList)
        try container.encode(asterisk, forKey: .asterisk)
        try container.encode(dagger, forKey: .dagger)
        try container.encode(primaryIsbn13, forKey: .primaryIsbn13)
        try container.encode(publisher, forKey: .publisher)
        try container.encode(nytDescription, forKey: .description)
        try container.encode(title, forKey: .title)
        try container.encode(author, forKey: .author)
        try container.encode(contributor, forKey: .contributor)
        try container.encode(bookImage, forKey: .bookImage)
        try container.encode(amazonProductUrl, forKey: .amazonProductUrl)
        try container.encode(ageGroup, forKey: .ageGroup)
        try container.encode(bookReviewLink, forKey: .bookReviewLink)
        try container.encode(sundayReviewLink, forKey: .sundayReviewLink)
    }
}

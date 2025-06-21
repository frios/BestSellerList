//
//  Globals.swift
//  NYT Best Sellers
//
//  Created by Ferdinand Rios on 2/19/21.
//

import UIKit

let NYT_API_KEY = "OTGpCyr0b3MRyHPHcyGb7EawVAn0GMUl"

let appID = "1555167310"

let AMAZON_ASSOCIATE_ID = "viciouscirc07-20"
let BooksAMillionAffiliateID = "100393973"
let BookshopAffiliateID = "24840"
let IndieBoundAffiliateID = "TheBestSellerList"

let bookSmallImageWidth = CGFloat(82.5)
let bookSmallImageHeight = CGFloat(125.0)

let bookMediumImageWidth = CGFloat(125)
let bookMediumImageHeight = CGFloat(189.3)


func loadJSON(withFilename filename: String) throws -> [NYTBook] {
    let fm = FileManager.default
    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
    if let url = urls.first {
        let fileURL = url.appendingPathComponent(filename)
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode([NYTBook].self, from: data)
            return decodedResponse
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    return [NYTBook]()
}

func convertISBN13ToISBN10(_ isbn13: String) -> String? {
    // Ensure the ISBN-13 is 13 characters and starts with "978"
    guard isbn13.count == 13, isbn13.hasPrefix("978") else {
        return nil
    }

    // Extract the 9 digits after "978"
    let core = isbn13.dropFirst(3).prefix(9)

    // Ensure all characters are digits
    guard core.allSatisfy({ $0.isNumber }) else {
        return nil
    }

    // Calculate the ISBN-10 check digit
    var sum = 0
    for (i, char) in core.enumerated() {
        if let digit = Int(String(char)) {
            sum += (i + 1) * digit
        } else {
            return nil
        }
    }

    let remainder = sum % 11
    let checkDigit = remainder == 10 ? "X" : String(remainder)

    return "\(core)\(checkDigit)"
}

//
//  ContentView.swift
//  Best Seller List
//
//  Created by Feldy Rios on 6/21/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    //MARK: - Variables and Constants
    
    @Environment(\.modelContext) var modelContext
    
    @Query var nytOverviewResponses: [NYTOverviewResponse]

    //MARK: - Main View
    var body: some View {
        ZStack {
            List {
                if nytOverviewResponses.isEmpty {
                    ContentUnavailableView("No lists yet", systemImage: "list.bullet", description: Text("NYT Bestseller lists not downloaded yet"))
                } else {
                    ForEach(nytOverviewResponses.first!.results.lists, id: \.listNameEncoded) { list in
                        Text("\(list.displayName)")
                    }
                }
             }
            .navigationBarTitle("Lists")
        }

//        .task {
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd"
//            let dateString = formatter.string(from: Date.now)
//            
//            if dateString >= nytOverviewResponses.first?.results.publishedDate ?? dateString {
//                await getLists()
//            }
//            
//        }
    }
    
    
    //MARK: - Functions
    
    func getLists() async {
        guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedResponse = try decoder.decode(NYTOverviewResponse.self, from: data)
            // decode the JSON
            var overviewResponse = NYTOverviewResponse()
            overviewResponse = decodedResponse
            overviewResponse.results.lists.sort { (lhs, rhs) -> Bool in
                lhs.displayName < rhs.displayName
            }
            //add the downloaded data to SwiftData
            modelContext.insert(overviewResponse)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    
}// end of struct





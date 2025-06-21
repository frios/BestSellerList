//
//  ListsView.swift
//  NYT Best Sellers
//
//  Created by Ferdinand Rios on 2/22/21.
//

import SwiftData
import SwiftUI

struct ListsView: View {
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
                    ForEach(nytOverviewResponses.last!.results.lists, id: \.listNameEncoded) { list in
                        NavigationLink(value: list) {
                            HStack {
                                Text("\(list.displayName)")/*.font(Font.custom("Georgia", size: 17))*/
                            }
                        }
                    }
                }
             }
            .navigationDestination(for: NYTList.self) { list in
                ListView(list: list)
                    .font(Font.custom("Georgia", size: 17))
            }
            .navigationBarTitle("Lists",/* displayMode: .large*/)
        }

        .task {
            await getLists()
        }
    }
    
    
    //MARK: - Functions
    
    func getLists() async {
        guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=\(NYT_API_KEY)") else {
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


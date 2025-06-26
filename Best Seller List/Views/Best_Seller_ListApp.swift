//
//  Best_Seller_ListApp.swift
//  Best Seller List
//
//  Created by Feldy Rios on 6/21/25.
//

import SwiftData
import SwiftUI


@main
struct Best_Seller_ListApp: App {
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
            }
        }
        .modelContainer(for: NYTOverviewResponse.self) {result in
            do {
                let container = try result.get()
                let descriptor = FetchDescriptor<NYTOverviewResponse>()
                let overviewResponse = try container.mainContext.fetchCount(descriptor)
                guard overviewResponse == 0 else { return }
                
                // Load and decode the JSON.
                guard let url = Bundle.main.url(forResource: "BestSellers", withExtension: "json") else {
                    fatalError("Failed to find Bestsellers.json")
                }
                let data = try Data(contentsOf: url)
                let response = try JSONDecoder().decode(NYTOverviewResponse.self, from: data)

                container.mainContext.insert(response)
            } catch {
                print("Unable to decode data. \(error.localizedDescription)")
            }
        }
    }
}
    


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
        .modelContainer(for: NYTOverviewResponse.self)
    }
    
}

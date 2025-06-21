//
//  Best_Seller_ListApp.swift
//  Best Seller List
//
//  Created by Feldy Rios on 6/21/25.
//

import SwiftData
import SwiftUI

let NYT_API_KEY = "OTGpCyr0b3MRyHPHcyGb7EawVAn0GMUl"
let appID = "1555167310"

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

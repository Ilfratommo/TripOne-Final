//
//  ContentView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var achievementsManager = AchievementsManager()
    
    var body: some View {
        TabView {
            ToDoListView(achievementsManager: achievementsManager)
                .tabItem {
                    Label("Itinerary", systemImage: "list.bullet")
                }
            
            AchievementsView(achievementsManager: achievementsManager)
                .tabItem {
                    Label("Achievements", systemImage: "star.fill")
                }
        }
    }
}
#Preview {
    ContentView()
}

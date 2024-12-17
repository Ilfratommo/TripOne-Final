//
//  AchievementManager.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 17/12/24.
//

import SwiftUI

class AchievementsManager: ObservableObject {
    @Published var completedBadges: [String] = [] // Tracks the names of completed badges
    
    // Function to mark a badge as "Done"
    func markAsDone(_ badge: String) {
        if !completedBadges.contains(badge) {
            completedBadges.append(badge)
        }
    }
    
    // Function to mark a badge as "Undone"
    func markAsUndone(_ badge: String) {
        if let index = completedBadges.firstIndex(of: badge) {
            completedBadges.remove(at: index)
        }
    }
}

//
//  AchievementsView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 17/12/24.
//

import SwiftUI

struct AchievementsView: View {
    @ObservedObject var achievementsManager: AchievementsManager
    
    var body: some View {
        VStack {
            Text("Achievements")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Spacer()
            
            // Display the two badges
            VStack(spacing: 20) {
                BadgeView(imageName: "Friend", description: "Meet 5 new people", achievementsManager: achievementsManager)
                BadgeView(imageName: "Pizza", description: "Try local food", achievementsManager: achievementsManager)
            }
            .padding()
            
            Spacer()
        }
    }
}


// Reusable Badge View
struct BadgeView: View {
    let imageName: String
    let description: String
    
    @ObservedObject var achievementsManager: AchievementsManager
    
    @State private var isDone: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            // Badge Image (black & white or colored)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .grayscale(isDone ? 0.0 : 1.0) // Colored if done, grayscale otherwise
            
            // Description
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Buttons: Done and Undone
            HStack(spacing: 40) {
                Button(action: {
                    isDone = true
                    achievementsManager.markAsDone(imageName)
                }) {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                        Text("Done")
                            .font(.caption)
                    }
                }
                
                Button(action: {
                    isDone = false
                    achievementsManager.markAsUndone(imageName)
                }) {
                    VStack {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                        Text("Undone")
                            .font(.caption)
                    }
                }
            }
            .padding(.bottom, 10)
        }
        .frame(width: 200, height: 250)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.systemGray6)))
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

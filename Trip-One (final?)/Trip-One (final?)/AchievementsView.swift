//
//  AchievementsView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 17/12/24.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        VStack {
            Text("Achievements here")
                .font(.largeTitle)
                .bold()
                .padding()

            Spacer()

            Text("Your achievements will appear here!")
                .font(.title2)
                .foregroundColor(.gray)

            Spacer()
        }
        .navigationTitle("Achievements")
    }
}


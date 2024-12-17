//
//  ActivityRingView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//

import SwiftUI

struct ActivityRingView: View {
    var progress: Double // Progress from 0.0 to 1.0
    var ringColor: Color
    var ringThickness: CGFloat = 20
    var size: CGFloat = 150
    var completedTasks: Int
    var totalTasks: Int

    @State private var animateProgress = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(ringColor.opacity(0.2), lineWidth: ringThickness)
                .frame(width: size, height: size)

            Circle()
                .trim(from: 0.0, to: animateProgress ? progress : 0.0)
                .stroke(ringColor, style: StrokeStyle(lineWidth: ringThickness, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .frame(width: size, height: size)
                .animation(.easeInOut(duration: 1.5), value: animateProgress)
                .onAppear {
                    print("ActivityRingView: Animation started for progress: \(progress)")
                    animateProgress = true
                }

            VStack {
                Text("\(Int(progress * 100))%")
                    .font(.title)
                    .bold()

                Text("\(completedTasks) of \(totalTasks) tasks")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}


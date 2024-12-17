//
//  EditSubTextView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 17/12/24.
//

import SwiftUI

struct EditSubTextView: View {
    @Binding var subText: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Write here your destination", text: $subText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Spacer()
            }
            .navigationTitle("Where are you going?")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

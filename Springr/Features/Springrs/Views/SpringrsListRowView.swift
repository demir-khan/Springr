//
//  SpringrsListRowView.swift
//  Springr
//
//  Created by Demir Khan on 17/02/2025.
//

import SwiftUI

struct SpringrsListRowView: View {
    @Binding
    var springr: Springr
    
    @State
    var showDetails = false
    
    private func colourForStatus (_ status: String) -> Color {
        switch status {
            case "Applied":
                return Color.blue//.opacity(0.8)
            case "Rejected":
                return Color.red//.opacity(0.8)
            case "Offer Recieved":
                return Color.green//.opacity(0.8)
            case "Action Required":
                return Color.orange//.opacity(0.8)
            default:
                return Color.yellow//.opacity(0.8)
        }
    }
    
    var body: some View {
        HStack {
            Text(springr.title)
            Spacer()
            Circle()
                .frame(width: 15, height: 15)
                .foregroundColor(colourForStatus(springr.status))
        }
        .contentShape(Rectangle()) // Expands tappable area
        .onTapGesture {
            showDetails = true // Show details when tapped
        }
        .sheet(isPresented: $showDetails) {
            DetailsOfSpringrView(springr: $springr)
        }
    }
}

#Preview {
    List {
        SpringrsListRowView(springr: .constant(Springr.samples[0]))
    }.listStyle(PlainListStyle())
}

//
//  DetailsOfSpringrView.swift
//  Springr
//
//  Created by Demir Khan on 17/02/2025.
//

import SwiftUI

struct DetailsOfSpringrView: View {
    @Binding
    var springr: Springr
    
    @Environment(\.dismiss)
    private var dismiss
    
    @State
    var showEditView = false
    
    private func back() {
        dismiss()
    }
    
    private func edit() {
        showEditView = true
    }
    
    private func emojiForType(_ type: String) -> String {
        switch type {
            case "Spring":
                return "🌸" // Emoji for Spring internship
            case "Summer":
                return "☀️" // Emoji for Summer internship
            case "Fall":
                return "🍁" // Emoji for Fall internship
            case "Winter":
                return "❄️" // Emoji for Winter internship
            default:
                return "🔍" // Default emoji in case no type is matched
        }
    }
    
    private func colourForStatus (_ status: String) -> Color {
        switch status {
            case "Applied":
                return Color.blue
            case "Rejected":
                return Color.red
            case "Offer Recieved":
                return Color.green
            case "Action Required":
                return Color.orange
            default:
                return Color.yellow
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                HStack(alignment: .top) {
                    Text("Description:")
                        .bold()
                    Spacer()
                    VStack(alignment: .trailing) { 
                        Text(springr.description)
                            .multilineTextAlignment(.leading)
                    }
                }
                HStack {
                    Text("Status:")
                        .bold()
                    Spacer()
                    Text(springr.status)
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundColor(colourForStatus(springr.status))
                }
                HStack {
                    Text("Type:")
                        .bold()
                    Spacer()
                    Text(springr.type + " " + emojiForType(springr.type))
                }
            }
            .sheet(isPresented: $showEditView) {
                EditSpringrView(springr: $springr) { updatedSpringr in
                    self.springr = updatedSpringr
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(springr.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: back) {
                        Text("Back")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: edit) {
                        Text("Edit")
                    }
                }
            }
        }
    }
}

#Preview {
    DetailsOfSpringrView(springr: .constant(Springr.samples[0]))
}

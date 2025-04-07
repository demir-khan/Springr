//
//  ContentView.swift
//  Springr
//
//  Created by Demir Khan on 11/02/2025.
//

import SwiftUI

struct SpringrsListView: View {
    
    @StateObject
    private var viewModel = SpringrsListViewModel()
    
    @State
    private var isAddSpringrDialogPresented = false
    
    private func presentAddSpringrView() {
        isAddSpringrDialogPresented.toggle()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List($viewModel.springrs) { $springr in
                    SpringrsListRowView(springr: $springr)
                }
                .listStyle(PlainListStyle())
                .navigationTitle(Text("Applications"))
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: presentAddSpringrView) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Application")
                        }
                    }
                    Spacer()
                }
            }
            .sheet(isPresented: $isAddSpringrDialogPresented) {
                AddSpringrView { springr in
                    viewModel.addSpringr(springr)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SpringrsListView()
    }
}

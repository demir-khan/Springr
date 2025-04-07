//
//  AddSpringrView.swift
//  Springr
//
//  Created by Demir Khan on 14/02/2025.
//

import SwiftUI


struct AddSpringrView: View {
    enum FocusableField : Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    @State
    private var springr = Springr(title: "", description: "", status: "", type: "")
    
    @Environment(\.dismiss)
    private var dismiss
    
    var onCommit: (_ springr: Springr) -> Void
    
    private func commit() {
        onCommit(springr)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")){
                    TextField("Title", text: $springr.title)
                        .focused($focusedField, equals: .title)
                }
                Section(header: Text("Description")){
                    TextField("Description", text: $springr.description)
                }
                Section() {
                    Picker("Status", selection: $springr.status){
                        Text("Applied").tag("Applied")
                        Text("Rejected").tag("Rejected")
                        Text("Offer Recieved").tag("Offer Recieved")
                        Text("Action Required").tag("Action Required")
                    }
                }
                Section() {
                    Picker("Type", selection: $springr.type){
                        Text("Spring").tag("Spring")
                        Text("Summer").tag("Summer")
                        Text("Fall").tag("Fall")
                        Text("Winter").tag("Winter")
                    }
                }
            }
            .navigationTitle("Add Springr")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem (placement: .confirmationAction){
                    Button(action: commit) {
                        Text("Add")
                    }
                    .disabled(springr.title.isEmpty)
                    .disabled(springr.description.isEmpty)
                    .disabled(springr.status.isEmpty)
                    .disabled(springr.type.isEmpty)
                }
            }
            .onAppear {
                focusedField = .title
            }
        }
    }
}


struct AddSpringrView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpringrView { springr in
            print("You added a new Springr titled \(springr.title)")
        }
    }
}

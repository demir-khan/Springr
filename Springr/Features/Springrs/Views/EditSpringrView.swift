//
//  EditSpringrView.swift
//  Springr
//
//  Created by Demir Khan on 17/02/2025.
//

import SwiftUI


struct EditSpringrView: View {
    enum FocusableField : Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    @Binding
    var springr: Springr
    
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
            .navigationTitle("Edit Springr")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem (placement: .confirmationAction){
                    Button(action: commit) {
                        Text("Done")
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


struct EditSpringrView_Previews: PreviewProvider {
    static var previews: some View {
        EditSpringrView(springr: .constant(Springr.samples[0])){ _ in
        }
    }
}

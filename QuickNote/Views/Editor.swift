//
//  Editor.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/28/22.
//

import SwiftUI

struct Editor: View {
    @Environment(\.managedObjectContext) var viewContext
    @Binding var notes: String
    var folder: FetchedResults<Folder>.Element
    
    var body: some View {
        VStack {
            TextEditor(text: $notes)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.horizontal, 10)
                .onAppear {
                    notes = folder.notes ?? ""
                }
                .onChange(of: notes) { newValue in
                    Controller().editNotes(folder: folder, notes: newValue, context: viewContext)
                }
        }
    }
}

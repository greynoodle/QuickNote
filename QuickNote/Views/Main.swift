//
//  Main.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/27/22.
//

import SwiftUI

struct Main: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var folders: FetchedResults<Folder>
    
    @State private var searchString = ""
    @State private var showingPopup = false
    @State private var notes = ""

    var body: some View {
        ZStack {
            List {
                Section {
                    ForEach(folders) { folder in
                        NavigationLink {
                            Editor(notes: $notes, folder: folder)
                        } label: {
                            FolderRow(name: folder.name ?? "New Folder")
                        }
                    }
                    .onDelete(perform: deleteFolder)
                } header: {
                    Text("All on my iPhone")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .searchable(text: $searchString, prompt: "Search")
            .navigationTitle("Folders")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.orange)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "folder.badge.plus")
                        .foregroundColor(.orange)
                        .onTapGesture {
                            showingPopup = true
                        }
                }
            }
            
            if showingPopup {
                Popup(showingPopup: $showingPopup)
            }
        }
    }
    
    private func deleteFolder(offsets: IndexSet) {
        offsets.map { folders[$0] }
            .forEach(viewContext.delete)
        
        Controller().save(context: viewContext)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

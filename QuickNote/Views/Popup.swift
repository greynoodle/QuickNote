//
//  Popup.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/27/22.
//

import SwiftUI

struct Popup: View {
    @Environment(\.managedObjectContext) private var viewContext    
    
    @State private var newFolderName = ""
    @State private var notes = ""
    @Binding var showingPopup: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.systemGray4))
                    .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.30)
                
                VStack {
                    Spacer()
                    
                    Text("New Folder")
                        .font(.headline)
                    
                    Text("Enter a name for this folder")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    TextField("Name", text: $newFolderName)
                        .frame(width: 200, height: 5)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    
                    Spacer()
                    
                    Color.gray.frame(width: 200, height: CGFloat(1))
                    
                    HStack {
                        Button {
                            showingPopup = false
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.orange)
                                .frame(maxWidth: .infinity)
                        }
                        Button {
                            Controller().addFolder(name: newFolderName, date: Date(), context: viewContext)
                            showingPopup = false
                        } label: {
                            Text("Save")
                                .foregroundColor(.orange)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    Spacer()
                }
                .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.35)
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup(showingPopup: .constant(false))
    }
}

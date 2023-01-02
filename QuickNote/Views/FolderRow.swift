//
//  FolderRow.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/27/22.
//

import SwiftUI

struct FolderRow: View {
    let name: String
    
    var body: some View {
        HStack {
            Image(systemName: "folder")
                .foregroundColor(.orange)

            Text(name)
        }
    }
}

struct FolderRow_Previews: PreviewProvider {
    static var previews: some View {
        FolderRow(name: "Folder")
    }
}

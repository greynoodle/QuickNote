//
//  QuickNoteApp.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/26/22.
//

import SwiftUI

@main
struct QuickNoteApp: App {
    @StateObject private var controller = Controller()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}

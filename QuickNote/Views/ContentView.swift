//
//  ContentView.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Main()
        }
        .accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  swiftuilearning
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected = 0
    
    var body: some View {
        TabView(selection: $tabSelected) {
            NavigationView() {
                OrderForm()
            }
            .tabItem {
                Image(systemName: (tabSelected == 0 ? "doc.text.fill" : "doc.text") )
                Text("New Order")
            }.tag(0)
            NavigationView() {
                OrderHistory(completedOrders: sampleOrders)
            }
            .tabItem {
                Image(systemName: (tabSelected == 1 ? "clock.fill" : "clock"))
                Text("History")
            }.tag(1)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}

//
//  ContentView.swift
//  swiftuilearning
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        
        NavigationView {
            TabView {
                OrderForm()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("New Order")
                    }

                OrderHistory(completedOrders: sampleOrders)
                    .tabItem {
                        Image(systemName: "clock.fill")
                        Text("History")
                }
            }
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}

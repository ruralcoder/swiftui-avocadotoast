//
//  CompletedOrderDetail.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import SwiftUI

struct CompletedOrderDetail: View {
    @State var order: CompletedOrder
    
    var body: some View {
        Form {
            Section(header: Text("SUMMARY")) {
                HStack {
                    Text("Bread")
                    Spacer()
                    Text(order.bread.rawValue).foregroundColor(.secondary)
                }
                HStack {
                    Text("Toasted")
                    Spacer()
                    Text(order.toast.rawValue).foregroundColor(.secondary)
                }
                HStack {
                    Text("Spread")
                    Spacer()
                    Text(order.spread.rawValue).foregroundColor(.secondary)
                }
                HStack {
                    Text("Avocado")
                    Spacer()
                    Text(order.avocado.rawValue).foregroundColor(.secondary)
                }
            }
            
            Section(header: Text("EXTRAS")) {
                if order.toppings.count > 0 {
                    ForEach(order.toppings, id: \.self) {
                        topping in
                        Text(topping.rawValue)
                    }
                } else {
                    Text("None")
                }
            }
            
            Section(header: Text("LAST ORDERED ON")) {
                Text(order.purchaseDate)
            }
            
            Section(header: Text("NOTES")) {
                Text(order.notes)
            }
            
        }.navigationBarTitle(Text(order.purchaseDate), displayMode: .inline)
        
        
        
            
    }
}

struct CompletedOrderDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            CompletedOrderDetail(order: sampleOrders[5])
        }
    }
}

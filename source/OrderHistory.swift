//
//  OrderHistory.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import SwiftUI

struct OrderHistory: View {
    var completedOrders: [CompletedOrder]
    
    var body: some View {
        
        List(completedOrders) { order in
            NavigationLink(destination: CompletedOrderDetail(order: order)) {
                CompletedOrderCell(order: order)
            }
        }.navigationBarTitle(Text("History"), displayMode: .inline)
    }
}


struct CompletedOrderCell: View {
    var order: CompletedOrder
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.summary)
                Text(order.purchaseDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack {
                ForEach(order.toppings, id: \.self) { topping in
                    ToppingIcon(topping: topping)
                }
            }
        }
    }
}



struct ToppingIcon: View {
    var topping: Toppings
    
    var body: some View {
        ZStack() {
            Circle().foregroundColor(toppingColor(topping: topping))
                .frame(width: 20, height: 20)
            
            Text(String(topping.rawValue.first ?? "?").uppercased())
                .foregroundColor(.white)
                .font(.system(size: 10))
        }
        
    }
    
    func toppingColor(topping: Toppings) -> Color {
        switch topping {
        case .salt:
            return .black
        case .redPepperFlakes:
            return .red
        case .eggs:
            return .yellow
        case .paprica:
            return .orange
        case .chives:
            return .green
        case .pickledOnion:
            return .pink
        case .watermelonRadish:
            return .purple
        }
    }
}




struct OrderHistory_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            OrderHistory(completedOrders: sampleOrders)
        }
    }
}


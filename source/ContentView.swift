//
//  ContentView.swift
//  swiftuilearning
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Ruralcoder. All rights reserved.
//

import SwiftUI

struct Order {
    var includeSalt: Bool
    var includeRedPepperFlakes: Bool
    var quantity: Int
    
    init() {
        self.includeSalt = false
        self.includeRedPepperFlakes = false
        self.quantity = 1
    }
}

enum Toppings: String {
    case salt = "salt"
    case redPepperFlakes = "redpepper"
    case eggs = "eggs"
}

struct CompletedOrder: Identifiable {
    var id: UUID
    var summary: String
    var purchaseDate: String
    var quantity: Int
    var toppings: Array<Toppings>
}



struct ContentView: View {
    var completedOrders = [
        CompletedOrder(id: UUID(), summary: "Rye with Almond Butter", purchaseDate: "5/30/19 8:47PM", quantity: 1, toppings: [.salt, .redPepperFlakes]),
        CompletedOrder(id: UUID(), summary: "Multi-Grain with Humous", purchaseDate: "5/29/19 5:00PM", quantity: 2, toppings: [.redPepperFlakes]),
        CompletedOrder(id: UUID(), summary: "Multi-Grain toast", purchaseDate: "5/28/19 1:13PM", quantity: 1, toppings: [.salt]),
        CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", purchaseDate: "5/27/19 9:47PM", quantity: 1, toppings: [.salt, .redPepperFlakes]),
        CompletedOrder(id: UUID(), summary: "Rye with Peanut Butter", purchaseDate: "5/26/19 5:40PM", quantity: 1, toppings: [.salt, .redPepperFlakes, .eggs]),
        CompletedOrder(id: UUID(), summary: "Wheat with Tapenade", purchaseDate: "5/25/19 5:40 PM",  quantity: 1, toppings: [.eggs]),
        CompletedOrder(id: UUID(), summary: "Sourdough with Vegemite", purchaseDate: "5/23/19 5:40 PM", quantity: 1, toppings: [.salt]),
        CompletedOrder(id: UUID(), summary: "Wheat with Féroce", purchaseDate: "5/22/19 5:40 PM", quantity: 1, toppings: [.salt, .redPepperFlakes, .eggs]),
        CompletedOrder(id: UUID(), summary: "Rye with Honey", purchaseDate: "5/21/19 2:33 PM", quantity: 1, toppings: []),
        CompletedOrder(id: UUID(), summary: "Multi-Grain Toast", purchaseDate: "5/20/19 10:47 AM", quantity: 1, toppings: [.salt, .eggs]),
        CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", purchaseDate: "5/19/19 7:00 AM", quantity: 1, toppings: []),
    ]
    
    var body: some View {
        List(completedOrders) { order in
            CompletedOrderCell(order: order)
        }
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
            
            ForEach(order.toppings, id: \.self) { topping in
                ToppingIcon(topping: topping)
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
        
            
        }
    }
}



struct ContentViewForm: View {
    @State var order: Order
    
    var body: some View {
        VStack {
            Text("Title").font(.title)
            
            Form {
                Section {
                    
                    Toggle(isOn: $order.includeSalt) {
                        Text("Include Salt")
                    }
                    Toggle(isOn: $order.includeRedPepperFlakes) {
                        Text("Include Red Pepper Flakes")
                    }
                    Stepper(value: $order.quantity, in: 1...10) {
                        Text("Quantity: \(order.quantity)")
                    }
                    HStack {
                        Text("G").onTapGesture(perform: {
                            self.order.quantity += 1
                        })
                        Spacer()
                        Text("\(order.quantity)").onTapGesture(perform: {
                            self.order.quantity += 1
                        })
                    }
                }
                Section {
                    Button(action: {print("awesome")}) {
                        Text("Submit Order")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let newOrder = Order()

    static var previews: some View {
        return ContentView()
    }
}

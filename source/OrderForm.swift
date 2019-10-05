//
//  OrderForm.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import SwiftUI

struct OrderForm: View {
    @State var order = Order()
    
    var body: some View {
        
        VStack {
            
            Text("Avocado Toast").font(.title)
            
            Form {
                Section(header: Text("Base")) {
                    Picker(selection: $order.bread, label: Text("Bread")) {
                        ForEach(Bread.allCases, id: \.self) { bread in
                            Text(bread.rawValue).tag(bread)
                        }
                    }
                    Picker(selection: $order.toast, label: Text("Toasted")) {
                        ForEach(Toast.allCases, id: \.self) { toast in
                            Text(toast.rawValue).tag(toast)
                        }
                    }
                }
                
                Section(header: Text("Toppings")) {
                    Picker(selection: $order.spread, label: Text("Spread")) {
                        ForEach(Spread.allCases, id: \.self) { spread in
                            Text(spread.rawValue).tag(spread)
                        }
                    }
                    Picker(selection: $order.avocado, label: Text("Avocado")) {
                        ForEach(Avocado.allCases, id: \.self) { avocado in
                            Text(avocado.rawValue).tag(avocado)
                        }
                    }
                }
                
                Section(header: Text("Extras")) {
                    Toggle(isOn: $order.includeSalt) {
                        Text("Include Salt")
                    }
                    Toggle(isOn: $order.includeRedPepperFlakes) {
                        Text("Include Red Pepper Flakes")
                    }
                    Toggle(isOn: $order.includeEggs) {
                        Text("Include Eggs")
                    }
                }
                
                Section {
                    Stepper(value: $order.quantity, in: 1...10) {
                        Text("Quantity: \(order.quantity)")
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



struct OrderForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderForm()
        }
    }
}



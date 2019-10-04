//
//  OrderForm.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Ruralcoder. All rights reserved.
//

import SwiftUI

struct OrderForm: View {
    @State var order = Order()
    
    var body: some View {
        
        
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
                
            }
            Section {
                Button(action: {print("awesome")}) {
                    Text("Submit Order")
                }
            }
        }.navigationBarTitle(Text("Avocado Toast"))
        
        
    }
}



struct OrderForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderForm()
        }
    }
}


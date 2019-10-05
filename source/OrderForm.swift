//
//  OrderForm.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import SwiftUI

struct BreadPicker: View {
    @Binding var bread: Bread
    
    var body: some View {
        Picker(selection: $bread, label: Text("Bread")) {
            ForEach(Bread.allCases) { bread in
                Text(bread.rawValue).tag(bread)
            }
        }
    }
}

struct ToastedPicker: View {
    @Binding var toast: Toast
    
    var body: some View {
        Picker(selection: $toast, label: Text("Toasted")) {
            ForEach(Toast.allCases) { toast in
                Text(toast.rawValue).tag(toast)
            }
        }
    }
}

struct SpreadPicker: View {
    @Binding var spread: Spread
    
    var body: some View {
        Picker(selection: $spread, label: Text("Spread")) {
            ForEach(Spread.allCases) { spread in
                Text(spread.rawValue).tag(spread)
            }
        }
    }
}

struct AvocadoPicker: View {
    @Binding var avocado: Avocado
    
    var body: some View {
        Picker(selection: $avocado, label: Text("Avocado")) {
            ForEach(Avocado.allCases) { avocado in
                Text(avocado.rawValue).tag(avocado)
            }
        }
    }
}



struct OrderForm: View {
    @State var order = Order()
    
    var body: some View {
        Form {
            Section(header: Text("Base")) {
                BreadPicker(bread: $order.bread)
                ToastedPicker(toast: $order.toast)
            }
            
            Section(header: Text("Toppings")) {
                SpreadPicker(spread: $order.spread)
                AvocadoPicker(avocado: $order.avocado)
            }
            
            Section(header: Text("Extras")) {
                Toggle(isOn: $order.includeSalt) {
                    Text("Include Salt")
                }
                Toggle(isOn: $order.includeRedPepperFlakes) {
                    Text("Include Red Pepper Flakes")
                }
                Toggle(isOn: $order.includeEggs.animation()) {
                    Text("Include Eggs")
                }
                if order.includeEggs {
                    NavigationLink(destination: EggPlacementView(eggPlacement: $order.eggPlacement)) {
                        Text("Egg Placement")
                    }
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



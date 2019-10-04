//
//  Models.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Ruralcoder. All rights reserved.
//

import Combine
import Foundation

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
    case salt = "Salt"
    case redPepperFlakes = "Red Pepper Flakes"
    case eggs = "Eggs"
    case paprica = "Paprica"
    case chives = "Chives"
    case pickledOnion = "Pickled Onions"
    case watermelonRadish = "Watermelon Radish"
}

enum Bread: String {
    case rye = "Rye"
    case sourdough = "Sourdough"
    case wheat = "Wheat"
    case multigrain = "Multi-Grain"
}

enum Spread: String {
    case none = "None"
    case almondbutter = "Almond Butter"
    case peanutbutter = "Peanut Butter"
    case humous = "Hummus"
    case chutney = "Chutney"
    case tapenade = "Tapenade"
    case feroce = "Féroce"
}

enum Avocado: String {
    case none = "None"
    case spread = "Spread"
    case sliced = "Sliced"
}

struct CompletedOrder: Identifiable {
    var id: UUID
    var summary: String
    var purchaseDate: String
    var quantity: Int = 1
    var bread: Bread = .sourdough
    var avocado: Avocado = .spread
    var spread: Spread = .none
    var toppings: Array<Toppings>
    
    var notes: String = "Dense nutty flavor with aromas of dark currants, fragrant tobacco, pencil shavings and blossom flowers. Full-bodied with racy acidity.\n\nBread had been chilled at 4˚C (slightly too cold) before being toasted for 216 seconds at 154˚C. Laid upon a Vosges oak cutting board before being spread with 16 grams of organic free range almond butter."
}



var sampleOrders = [
    CompletedOrder(id: UUID(), summary: "Rye with Almond Butter", purchaseDate: "5/30/19 8:47PM", quantity: 1, toppings: [.salt, .redPepperFlakes]),
    CompletedOrder(id: UUID(), summary: "Multi-Grain with Humous", purchaseDate: "5/29/19 5:00PM", quantity: 2, toppings: [.redPepperFlakes]),
    CompletedOrder(id: UUID(), summary: "Multi-Grain toast", purchaseDate: "5/28/19 1:13PM", quantity: 1, toppings: [.salt, .chives]),
    CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", purchaseDate: "5/27/19 9:47PM", quantity: 1, toppings: [.salt, .redPepperFlakes]),
    CompletedOrder(id: UUID(), summary: "Rye with Peanut Butter", purchaseDate: "5/26/19 5:40PM", quantity: 1, toppings: [.salt, .redPepperFlakes, .eggs]),
    CompletedOrder(id: UUID(), summary: "Wheat with Tapenade", purchaseDate: "5/25/19 5:40 PM",  quantity: 1, toppings: [.pickledOnion, .watermelonRadish, .chives]),
    CompletedOrder(id: UUID(), summary: "Sourdough with Vegemite", purchaseDate: "5/23/19 5:40 PM", quantity: 1, toppings: [.salt]),
    CompletedOrder(id: UUID(), summary: "Wheat with Féroce", purchaseDate: "5/22/19 5:40 PM", quantity: 1, toppings: [.salt, .redPepperFlakes, .eggs]),
    CompletedOrder(id: UUID(), summary: "Rye with Honey", purchaseDate: "5/21/19 2:33 PM", quantity: 1, toppings: []),
    CompletedOrder(id: UUID(), summary: "Multi-Grain Toast", purchaseDate: "5/20/19 10:47 AM", quantity: 1, toppings: [.salt, .eggs]),
    CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", purchaseDate: "5/19/19 7:00 AM", quantity: 1, toppings: []),
]

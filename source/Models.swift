//
//  Models.swift
//  avocadotoast
//
//  Created by Stephen Anderson on 10/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Combine
import Foundation
import SwiftUI


struct Order {
    var includeSalt: Bool = false
    var includeRedPepperFlakes: Bool = false
    var includeEggs: Bool = false
    var quantity: Int = 1
    var bread: Bread = .sourdough
    var toast: Toast = .lightly
    var avocado: Avocado = .spread
    var spread: Spread = .none
    var eggPlacement: UnitPoint = UnitPoint(x: 0, y: 0)
}


enum Toppings: String, CaseIterable, Hashable, Identifiable {
    case salt = "Salt"
    case redPepperFlakes = "Red Pepper Flakes"
    case eggs = "Eggs"
    case paprica = "Paprica"
    case chives = "Chives"
    case pickledOnion = "Pickled Onions"
    case watermelonRadish = "Watermelon Radish"
    
    var id: Toppings {self}
}

enum Bread: String, CaseIterable, Hashable, Identifiable {
    case rye = "Rye"
    case sourdough = "Sourdough"
    case wheat = "Wheat"
    case multigrain = "Multigrain"

    var id: Bread {self}
}

enum Toast: String, CaseIterable, Hashable, Identifiable {
    case none = "Not toasted"
    case lightly = "Lightly toasted"
    case well = "Well toasted"
    case crunch = "Crunch toasted"
    
    var id: Toast {self}
}

enum Spread: String, CaseIterable, Hashable, Identifiable {
    case none = "None"
    case almondbutter = "Almond Butter"
    case peanutbutter = "Peanut Butter"
    case honey = "Honey"
    case almou = "Almou"
    case tapenade = "Tapenade"
    case hummus = "Hummus"
    case mayonnaise = "Mayonnaise"
    case kyopolou = "Kyopolou"
    case adjvar = "Adjvar"
    case pindjur = "Pindjur"
    case vegemite = "Vegemite"
    case chutney = "Chutney"
    case feroce = "Féroce"
    case kartoffelkase = "kartoffelkäse"
    case tartarsauce = "Tartar Sauce"

    var id: Spread {self}
}

enum Avocado: String, CaseIterable, Hashable, Identifiable {
    case none = "None"
    case spread = "Spread"
    case sliced = "Sliced"
    
    var id: Avocado {self}
}

struct CompletedOrder: Identifiable {
    var id: UUID
    var summary: String
    var bread: Bread = .sourdough
    var toast: Toast = .lightly
    var avocado: Avocado = .spread
    var spread: Spread = .none
    var purchaseDate: String
    var quantity: Int = 1
    var toppings: Array<Toppings>
    var notes: String = "Dense nutty flavor with aromas of dark currants, fragrant tobacco, pencil shavings and blossom flowers. Full-bodied with racy acidity.\n\nBread had been chilled at 4˚C (slightly too cold) before being toasted for 216 seconds at 154˚C. Laid upon a Vosges oak cutting board before being spread with 16 grams of organic free range almond butter."
}



var sampleOrders = [
    CompletedOrder(id: UUID(), summary: "Rye with Almond Butter", bread:.rye, toast: .none, spread: .almondbutter, purchaseDate: "5/30/19 8:47PM", quantity: 1, toppings: [.salt, .redPepperFlakes]),
    CompletedOrder(id: UUID(), summary: "Multi-Grain with Hummus", bread:.multigrain, spread: .hummus, purchaseDate: "5/29/19 5:00PM", quantity: 2, toppings: [.redPepperFlakes]),
    CompletedOrder(id: UUID(), summary: "Multi-Grain toast", bread:.multigrain, toast: .well, purchaseDate: "5/28/19 1:13PM", quantity: 1, toppings: [.salt, .chives]),
    CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", bread:.sourdough, spread: .chutney, purchaseDate: "5/27/19 9:47PM", quantity: 1, toppings: [.salt, .redPepperFlakes]),
    CompletedOrder(id: UUID(), summary: "Rye with Peanut Butter", bread:.rye, spread: .peanutbutter, purchaseDate: "5/26/19 5:40PM", quantity: 1, toppings: [.salt, .redPepperFlakes, .eggs]),
    CompletedOrder(id: UUID(), summary: "Wheat with Tapenade", bread:.wheat, toast: .crunch, spread: .tapenade, purchaseDate: "5/25/19 5:40 PM",  quantity: 1, toppings: [.pickledOnion, .watermelonRadish, .chives]),
    CompletedOrder(id: UUID(), summary: "Sourdough with Vegemite", bread:.sourdough, spread: .vegemite, purchaseDate: "5/23/19 5:40 PM", quantity: 1, toppings: [.salt]),
    CompletedOrder(id: UUID(), summary: "Wheat with Féroce", bread:.wheat, spread: .feroce, purchaseDate: "5/22/19 5:40 PM", quantity: 1, toppings: [.salt, .redPepperFlakes, .eggs]),
    CompletedOrder(id: UUID(), summary: "Rye with Honey", bread:.rye, spread: .honey, purchaseDate: "5/21/19 2:33 PM", quantity: 1, toppings: []),
    CompletedOrder(id: UUID(), summary: "Multi-Grain Toast", bread:.multigrain, toast: .well, purchaseDate: "5/20/19 10:47 AM", quantity: 1, toppings: [.salt, .eggs]),
    CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", bread:.sourdough, spread: .chutney, purchaseDate: "5/19/19 7:00 AM", quantity: 1, toppings: []),
    CompletedOrder(id: UUID(), summary: "Sourdough with Chutney", bread:.sourdough, toast: .crunch, spread: .none, purchaseDate: "5/19/19 7:00 AM", quantity: 1, toppings: [.salt, .eggs, .pickledOnion, .watermelonRadish, .chives, .paprica]),
]

# avocadotoast

This repo is for all those that watched in awe the 2019 WWDC video "Swift Essentials" and wanted to try to build avocadotoast, but failed.

Here is a working version of `avocadotoast` 

*All rights remain with Apple Inc. I just patched the examples in the video with Apple's latest XCode 11 and Swift 5.1*

## What was missing

### Identifiable
It seems the example in the video did not have the struct `Order` and `CompletedOrder` implementing the `Identifiable` protocol. Which is now needed for all things `List` and `ForEach`.

```
struct CompletedOrder: Identifiable {
    var id: UUID
    var summary: String
    var purchaseDate: String
    var quantity: Int
    var includeSalt: Bool
    var includeRedPepperFlakes: Bool
}
```

So by implementing the `Identifiable` protocol and of course adding a `id` field we are set.

Constructing it of course is as easy.
```
CompletedOrder(id: UUID(), summary: "Rye with Almond Butter", purchaseDate: "5/30/19 8:47PM", quantity: 1, includeSalt: true, includeRedPepperFlakes: true),

```

### The SaltIcon
In the example the presenter is using `SaltIcon` and `RedPepperFlakesIcon` which they never show the code for those.
I saw others trying to use Unicode characters for Salt and Pepper, but I wanted to the original look and feel and an opportunity to play with `ZStack`.

```
struct SaltIcon: View {
    var topping: Toppings
    
    var body: some View {
        ZStack() {
            Circle().foregroundColor(.black)
                .frame(width: 20, height: 20)
            
            Text("S")
                .foregroundColor(.white)
                .font(.system(size: 10))
        }
        
    }
```

### Generic toppings
At some point the presenter replaces the `if...then..else` statements for injecting the SaltIcon with a more generic `ToppingIcon` again not showing how it was done.

I introduced an enum
```
enum Toppings: String {
    case salt = "salt"
    case redPepperFlakes = "redpepper"
    case eggs = "eggs"
}
```

Changed the struct CompletedOrder to include an array for those toppings.
```
struct CompletedOrder: Identifiable {
    var id: UUID
    var summary: String
    var purchaseDate: String
    var quantity: Int
    var toppings: Array<Toppings>
}
```

Took the `SaltIcon` and made it adaptive `ToppingIcon` which took the parameter `topping` like in the video.

```
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
```

and used the presenters code

```
ForEach(order.toppings) { topping in
    ToppingIcon(topping: topping)
}
```

BUT...it no longer works in the latest SwiftUI, like so many examples.

Now ForEach was complaining that the `enum Toppings` was not `Identifiable`.In the CompletedOrder it makes sense to have a field called `id`, but an `enum` ......MindBlown! 

I came across the solution, specify the `id` in the ForEach using `id: \.self`

```
ForEach(order.toppings, id: \.self) { topping in
    ToppingIcon(topping: topping)
}
```



## Navigation changes
The presentation has the following code which of course does not work.
```
NavigationView {
    TabbedView {
        OrderForm()
            .tabItemLabel {
                Image(systemName: "square.and.pencil")
                Text("New Order")
             }
```

the working version is

```
NavigationView {
    TabView {
        OrderForm()
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("New Order")
             }
```




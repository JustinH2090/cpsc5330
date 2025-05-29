import UIKit

let drink1 = (name: "Coke", price: 1.00)
let drink2 = (name: "Pepsi", price: 1.20)
let drink3 = (name: "Mtn Dew", price: 1.65)
let drink4 = (name: "Dr Pepper", price: 1.15)
let drink5 = (name: "Sprite", price: 1.15)
let menu = [drink1,drink2,drink3,drink4,drink5]

let mathResult = smallLargeAverage(menu: menu)
let formattedSmall = String(format: "%.2f", mathResult.small)
let formattedHigh = String(format: "%.2f", mathResult.large)
let formattedAverage = String(format: "%.2f", mathResult.average)

print("Math results: ")
print("low: ", formattedSmall)
print("high: ", formattedHigh)
print("average: ", formattedAverage)

let overP = higherThanAverageCost(menu: menu)
print("\nOver priced drinks: ")
for drink in overP {print(drink.overName,String(format: "%.2f", drink.overPrice))}

let overPTwo = otherFilteringFunc(menu: menu)
print("\nOver priced drinks using the other func:")
for drink in overPTwo {print(drink.overName, String(format: "%.2f", drink.overPrice))}

func smallLargeAverage(menu: [(name: String, price: Double)])
                            -> (small: Double, large: Double, average: Double){
    var min = menu[0].price
    var avg = 0.0
    var max = menu[0].price
    var count = 0.0
    for item in menu{
        let price = item.price
        if price > max {max = price}
        
        if price < min {min = price}
        avg += price
        count += 1
        }
        avg = avg / count
        return (small: min, large: max, average: avg)
    }
    
func higherThanAverageCost(menu: [(name: String, price: Double)])
                            -> [(overName: String, overPrice: Double)]{
     let mathResult = smallLargeAverage(menu: menu)
     let averagePrice = mathResult.average
     var overPricedDrinks: [(overName: String, overPrice: Double)] = []
     for item in menu{
         if item.price > averagePrice{
         overPricedDrinks.append((overName: item.name, overPrice: item.price))}
     }
     
     return overPricedDrinks
     
}

func otherFilteringFunc(menu: [(name: String, price: Double)]) -> [(overName: String, overPrice: Double)]{

    let mathResult = smallLargeAverage(menu: menu)
    let averagePrice = mathResult.average
    
    let overPricedDrinks = menu.filter {drink in drink.price > averagePrice}.map { drink in (overName: drink.name, overPrice: drink.price) }
    
    return overPricedDrinks
}

import Foundation


var mockCategories = [
  TransactionCategory(name: "Utilities"),
  TransactionCategory(name: "Car"),
  TransactionCategory(name: "Food"),
  TransactionCategory(name: "Groceries"),
  TransactionCategory(name: "Misc"),
  TransactionCategory(name: "Fitness"),
  TransactionCategory(name: "Clothing"),
  TransactionCategory(name: "Alcohol & Drugs"),
  TransactionCategory(name: "Income")
]

#if DEBUG
func getCategoryFor(name: String) -> TransactionCategory {
  mockCategories.first { $0.name == name }!
}
#endif

//
//  MockTransactions.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/1/21.
//

import Foundation

fileprivate func date(from string: String) -> Date {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "MM-dd-yyyy"
  guard let date = dateFormatter.date(from: string) else {
    print("formatting date failed: \(string)")
    return Date()
  }
  return date
}

fileprivate extension Date {
  static func from(string: String) -> Date {
    date(from: string)
  }
}

var mockTransactions = [
  // September 2021
  Transaction(date: Date.from(string: "09/01/2021"), amount: 25.0, description: "Harris Teeter", category: getCategoryFor(name: "Groceries"), type: .expense),
  Transaction(date: Date.from(string: "09/01/2021"), amount: 43, description: "really long description too.  the cat ran and jumped down from the fence", category: getCategoryFor(name: "Alcohol & Drugs"), type: .expense),
  Transaction(date: Date.from(string: "09/01/2021"), amount: 93.0, description: "Earth Treks", category: getCategoryFor(name: "Fitness"), type: .expense),
  Transaction(date: Date.from(string: "09/01/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),


  // August 2021
  Transaction(date: Date.from(string: "08/31/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "08/31/2021"), amount: 1150.0, description: "Rent", category: getCategoryFor(name: "Utilities"), type: .expense),
  Transaction(date: Date.from(string: "08/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "08/28/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "08/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),
  Transaction(date: Date.from(string: "08/27/2021"), amount: 24.5, description: "Gas - Citgo", category: getCategoryFor(name: "Car"), type: .expense),

  // July 2021
  Transaction(date: Date.from(string: "07/31/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "07/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "07/28/2021"), amount: 9.43, description: "Chipotle", category:getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "07/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // June 2021
  Transaction(date: Date.from(string: "06/30/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "06/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "06/28/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "06/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // May 2021
  Transaction(date: Date.from(string: "05/31/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "05/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "05/28/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "05/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // April 2021
  Transaction(date: Date.from(string: "04/30/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "04/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "04/28/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "04/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // March 2021
  Transaction(date: Date.from(string: "03/31/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "03/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "03/28/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "03/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // February 2021
  Transaction(date: Date.from(string: "02/28/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "02/28/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "02/14/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "02/10/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // January 2021
  Transaction(date: Date.from(string: "01/31/2021"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "01/30/2021"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "01/28/2021"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "01/27/2021"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // December 2020
  Transaction(date: Date.from(string: "12/31/2020"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "12/30/2020"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "12/28/2020"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "12/27/2020"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),

  // November 2020
  Transaction(date: Date.from(string: "11/30/2020"), amount: 1500.0, description: "Paycheck", category: getCategoryFor(name: "Income"), type: .income),
  Transaction(date: Date.from(string: "11/30/2020"), amount: 100.0, description: "Parking", category: getCategoryFor(name: "Car"), type: .expense),
  Transaction(date: Date.from(string: "11/28/2020"), amount: 9.43, description: "Chipotle", category: getCategoryFor(name: "Food"), type: .expense),
  Transaction(date: Date.from(string: "11/27/2020"), amount: 6.13, description: "Target (deodorant)", category: getCategoryFor(name: "Misc"), type: .expense),
]

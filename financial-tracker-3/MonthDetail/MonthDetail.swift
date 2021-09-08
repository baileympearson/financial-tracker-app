import SwiftUI

struct MonthDetail: View {
  @EnvironmentObject var transactionService: TransactionService
  let year: String
  let month: String
  
  var pageTitle: String {
    "\(month.capitalized) \(year)"
  }
  
  var transactionsForMonth: [Transaction] {
    let key = "\(year) \(month)"
    return transactionService.transactions.groupedByMonth[key] ?? []
  }
  
  var body: some View {
    VStack {
      if !transactionsForMonth.isEmpty {
        List {
          Section(header: Text("Overview")) {
            SpendingOverviewTable(transactions: transactionsForMonth)
          }
          
          Section(header: Text("Top Spending Categories")) {
            SpendingCategoryTable(spendingByCategory: transactionsForMonth.totalSpendingByCategory.take(3))
            
            if !transactionsForMonth.totalSpendingByCategory.isEmpty {
              NavigationLink(
                destination:
                  List {
                    SpendingCategoryTable(
                      spendingByCategory: transactionsForMonth.totalSpendingByCategory
                    )
                  }
                  .listStyle(InsetGroupedListStyle())
                  .navigationTitle("Spending By Category"),
                label: {
                  Text("View All")
                })
            }
          }
          
          Section(header: Text("Transactions")) {
            TransactionTable(transactions: transactionsForMonth)
            if !transactionsForMonth.isEmpty {
              NavigationLink(
                destination: TransactionDetailsList(month: month),
                label: {
                  Text("View All")
                })
            }
          }
        }
        .listStyle(InsetGroupedListStyle())
      } else {
        VStack {
          Text("Looks like you haven't spent money this month!")
            .font(.title3)
          }
      }
    }
    .navigationTitle(pageTitle)
    
  }
}

struct MonthDetail_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView{
      MonthDetail(year: "2021", month: "August")
        .environmentObject(AppModel.mockModel)
    }
  }
}

struct TransactionTable: View {
  let transactions: [Transaction]
  
  var body: some View {
    if transactions.isEmpty {
      Text("You haven't spent anything this month!")
    } else {
      ForEach(transactions) {
        TransactionListItem(transaction: $0)
      }
    }
  }
}

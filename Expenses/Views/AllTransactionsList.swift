//
//  AllTransactionsList.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import SwiftUI

struct AllTransactionsList: View {
    
    @EnvironmentObject var transactionsListViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(transactionsListViewModel.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    Section {
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AllTransactionsList()
}

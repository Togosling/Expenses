//
//  RecentTransactionList.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var transactionsViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    AllTransactionsList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionsViewModel.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    RecentTransactionList()
}

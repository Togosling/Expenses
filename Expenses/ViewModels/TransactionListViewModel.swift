//
//  TransactionListViewModel.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import Foundation
import OrderedCollections

class TransactionListViewModel: ObservableObject {
    
    @Published var transactions: [TransactionModel] = []
    
    typealias TransactionsGroups = OrderedDictionary<String, [TransactionModel]>
    typealias TransactionPrefixSum = [(String, Double)]
    
    init() {
        TransactionService.shared.getTransactions { [weak self] transactions in
            self?.transactions = transactions
        }
    }
    
    func groupTransactionsByMonth() -> TransactionsGroups {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionsGroups(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        guard !transactions.isEmpty else { return [] }

        
        return []
    }
}

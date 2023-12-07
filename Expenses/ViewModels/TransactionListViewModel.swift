//
//  TransactionListViewModel.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import Foundation

class TransactionListViewModel: ObservableObject {
    
    @Published var transactions: [TransactionModel] = []
    
    init() {
        TransactionService.shared.getTransactions { [weak self] transactions in
            self?.transactions = transactions
        }
    }
}

//
//  ExpensesApp.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import SwiftUI

@main
struct ExpensesApp: App {
    @StateObject var transactionListViewModel = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListViewModel)
        }
    }
}

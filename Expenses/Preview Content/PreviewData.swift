//
//  PreviewData.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import Foundation

var transactionPreviewData = TransactionModel(id: 1, date: "01.24.2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "SoftWare", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [TransactionModel](repeating: transactionPreviewData, count: 10)

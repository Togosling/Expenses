//
//  TransactionService.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import Foundation
import Combine

class TransactionService {
    
    static let shared = TransactionService()
    
    private var cancellables = Set<AnyCancellable>()
    
    func getTransactions(completion: @escaping ([TransactionModel]) -> ()) {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [TransactionModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished fetching transactions")
                case .failure(let error):
                    print("Failed fetching transactions \(error.localizedDescription)")
                }
            } receiveValue: { transactions in
                print(transactions)
                completion(transactions)
            }
            .store(in: &cancellables)
    }
}

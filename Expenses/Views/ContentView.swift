//
//  ContentView.swift
//  Expenses
//
//  Created by Тагай Абдылдаев on 2023/12/7.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    LineChartView(data: [8,2,4,6,12,9,2], title: "900$", style: ChartStyle(backgroundColor: Color(uiColor: .systemBackground), accentColor: .primary, gradientColor: GradientColor(start: Color.icon.opacity(0.4), end: Color.icon), textColor: .primary, legendTextColor: .primary, dropShadowColor: .primary))
                        .frame(height: 300)
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    ContentView()
}

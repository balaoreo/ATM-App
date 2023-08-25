//
//  ContentView.swift
//  ATM
//
//  Created by Keona Balaoro on 9/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var balance = 0.0
    @State private var inputStr = "0.00"
    @State private var transactions: [Double] = []
    @State private var recordStr = ""
    var body: some View {
        VStack {
            Text("ATM")
                .font(.title)
                .fontWeight(.bold)
                .padding(50)
            
            HStack {
                Text("Enter Amount:")
                    .padding(.leading, 50)
                TextField("0.00", text: $inputStr)
            }
            HStack{
                Button("Deposit") {
                    let inputAmount = Double(inputStr)
                    balance = balance + inputAmount!
                    transactions.append(inputAmount!)
                    recordStr = recordStr + "\nDeposit: \(inputStr)"
                }
                .padding(30)
                .buttonStyle(.borderedProminent)
                Button("Withdraw") {
                    let inputAmount = Double(inputStr)
                    if inputAmount! <= balance {
                        balance = balance - inputAmount!
                        transactions.append(-inputAmount!)
                        recordStr = recordStr + "\nWithdraw: \(inputStr)"
                    }
                    else {
                        recordStr = recordStr + "\nInsufficient Fund"
                        print("Insufficient Fund.")
                    }
                }
                .padding(30)
                .buttonStyle(.borderedProminent)
                
            }
            Text("Balance: $\(balance, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .padding(50)
            
            Text(recordStr)
                .font(.footnote)
                .padding(50)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

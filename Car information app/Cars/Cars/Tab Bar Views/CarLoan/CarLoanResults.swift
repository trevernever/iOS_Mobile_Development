//
//  CarLoanResults.swift
//  Cars
//
//  Created by Osman Balci on 1/23/22.
//  Copyright © 2022 Osman Balci. All rights reserved.
//

import SwiftUI

struct CarLoanResults: View {
    
    // Input Parameters
    let amountBorrowed: Double
    let interestRate: Double
    let numberOfYears: Double
    
    var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        formatter.groupingSize = 3
        formatter.groupingSeparator = ","
        return formatter
    }()
    
    var body: some View {
        Form {
            Section(header: Text("Principal Amount Borrowed")) {
                Text("$"+numberFormatter.string(from: amountBorrowed as NSNumber)!)
            }
            Section(header: Text("Interest Rate Percentage")) {
                Text(String(format: "%.3f", interestRate)+"%")
            }
            Section(header: Text("Number of Years to Pay the Loan")) {
                Text(String(format: "%.3f", numberOfYears))
            }
            Section(header: Text("Monthly Payment")) {
                Text("$"+numberFormatter.string(from: monthlyPayment as NSNumber)!)
            }
            Section(header: Text("Total Interest")) {
                Text("$"+numberFormatter.string(from: totalInterest as NSNumber)!)
            }
        }   // End of Form
        .navigationBarTitle(Text("Car Loan Processing Results"), displayMode: .inline)
    }

}

struct CarLoanResults_Previews: PreviewProvider {
    static var previews: some View {
        CarLoanResults(amountBorrowed: 45000, interestRate: 4.5, numberOfYears: 5)
    }
}

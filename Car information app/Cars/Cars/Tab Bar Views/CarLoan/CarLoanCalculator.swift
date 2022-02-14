//
//  CarLoanCalculator.swift
//  Cars
//
//  Created by Osman Balci on 1/23/22.
//  Copyright © 2022 Osman Balci. All rights reserved.
//

import SwiftUI

// Global Variables
var monthlyPayment = 0.0
var totalInterest = 0.0

struct CarLoanCalculator: View {
    
    @State private var showErrorMessage = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    @State private var amountBorrowedTextFieldValue = ""
    @State private var amountBorrowed = 0.0
    @State private var interestRateTextFieldValue = ""
    @State private var interestRate = 0.0
    @State private var numberOfYearsTextFieldValue = ""
    @State private var numberOfYears = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                Form {
                    Section(header: Text("Principal Amount Borrowed"),
                            footer: Text("Tap Return on keyboard after entering the value")
                                .font(.custom("Times New Roman", size: 12))
                    ) {
                        HStack {
                            TextField("Enter amount to borrow", text: $amountBorrowedTextFieldValue)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                .onSubmit {
                                    // Record entered value optionally after Return key is tapped
                                    /*
                                     Try to convert amountBorrowedTextFieldValue from String to Double type.
                                     IF conversion is possible THEN set the result to amountBorrowed
                                     ELSE show the error message.
                                     */
                                    if let amount = Double(amountBorrowedTextFieldValue) {
                                        amountBorrowed = amount
                                    } else {
                                        showErrorMessage = true
                                        errorTitle = "Invalid Input"
                                        errorMessage = "Entered value is not a number"
                                    }
                                }

                            // Button to clear the text field
                            Button(action: {
                                amountBorrowedTextFieldValue = ""
                                amountBorrowed = 0.0
                            }) {
                                Image(systemName: "multiply.circle")
                                    .imageScale(.medium)
                                    .font(Font.title.weight(.regular))
                            }
                        }   // End of HStack
                    }
                    Section(header: Text("Interest Rate Percentage"),
                            footer: Text("Tap Return on keyboard after entering the value")
                                .font(.custom("Times New Roman", size: 12))
                    ) {
                        HStack {
                            TextField("Enter interest rate, e.g., 4.5", text: $interestRateTextFieldValue)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                .onSubmit {
                                    // Record entered value optionally after Return key is tapped
                                    /*
                                     Try to convert interestRateTextFieldValue from String to Double type.
                                     IF conversion is possible THEN set the result to interestRate
                                     ELSE show the error message.
                                     */
                                    if let interest = Double(interestRateTextFieldValue) {
                                        interestRate = interest
                                    } else {
                                        showErrorMessage = true
                                        errorTitle = "Invalid Input"
                                        errorMessage = "Entered value is not a number"
                                    }
                                    // If interestRate > 30 then show the error message
                                    if interestRate > 30 {
                                        showErrorMessage = true
                                        errorTitle = "Out of Range"
                                        errorMessage = "Interest rate is not allowed to be > 30%"
                                    }
                                }

                            // Button to clear the text field
                            Button(action: {
                                interestRateTextFieldValue = ""
                                interestRate = 0.0
                            }) {
                                Image(systemName: "multiply.circle")
                                    .imageScale(.medium)
                                    .font(Font.title.weight(.regular))
                            }
                        }   // End of HStack
                    }
                    Section(header: Text("Number of Years"),
                            footer: Text("Tap Return on keyboard after entering the value")
                                .font(.custom("Times New Roman", size: 12))
                    ) {
                        HStack {
                            TextField("Enter number of years, e.g., 5.8", text: $numberOfYearsTextFieldValue)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                                .onSubmit {
                                    // Record entered value optionally after Return key is tapped
                                    /*
                                     Try to convert numberOfYearsTextFieldValue from String to Double type.
                                     IF conversion is possible THEN set the result to numberOfYears
                                     ELSE show the error message.
                                     */
                                    if let years = Double(numberOfYearsTextFieldValue) {
                                        numberOfYears = years
                                    } else {
                                        showErrorMessage = true
                                        errorTitle = "Invalid Input"
                                        errorMessage = "Entered value is not a number"
                                    }
                                    // If numberOfYears > 10 then show the error message
                                    if numberOfYears > 10 {
                                        showErrorMessage = true
                                        errorTitle = "Out of Range"
                                        errorMessage = "Number of years is not allowed to be > 10"
                                    }
                                }

                            // Button to clear the text field
                            Button(action: {
                                numberOfYearsTextFieldValue = ""
                                numberOfYears = 0.0
                            }) {
                                Image(systemName: "multiply.circle")
                                    .imageScale(.medium)
                                    .font(Font.title.weight(.regular))
                            }
                        }   // End of HStack
                    }
                    
                    // Do not show the Calculate Loan navigation link unless all entered values are valid
                    if inputDataValidated() {
                        Section(header: Text("Car Loan Calculation")) {
                            HStack {
                                NavigationLink(destination: showCarLoanResults) {
                                    HStack {
                                        Image(systemName: "dollarsign.circle")
                                            .imageScale(.medium)
                                            .font(Font.title.weight(.regular))
                                            .foregroundColor(.blue)
                                        Text("Calculate Loan")
                                            .font(.system(size: 16))
                                    }
                                }
                                .frame(minWidth: 300, maxWidth: 500)
                            }
                        }
                    }
                }   // End of Form
                .navigationBarTitle(Text("Car Loan Calculator"), displayMode: .inline)
                .alert(isPresented: $showErrorMessage, content: { self.errorMessageAlert(title:self.errorTitle, message:self.errorMessage) })
                
            }   // End of ZStack
            
        }   // End of NavigationView
        // Use single column navigation view for iPhone and iPad
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func errorMessageAlert(title: String, message: String) -> Alert {
        return Alert(title: Text(title),
                     message: Text(message),
                     dismissButton: .default(Text("OK")) )
    }
    
    func inputDataValidated() -> Bool {
        if amountBorrowed == 0.0 || interestRate == 0.0 || numberOfYears == 0.0 || interestRate > 30 || numberOfYears > 10 {
            return false
        }
        return true
    }
    
    var showCarLoanResults: some View {
        calculateLoan()
        return AnyView(CarLoanResults(amountBorrowed: amountBorrowed, interestRate: interestRate, numberOfYears: numberOfYears))
    }
    
    func calculateLoan() {
        /*
         M = (P (i(1 + i)**n)) / ((1 + i)**n - 1)
         
         M = Monthly payment amount
         P = Principal amount borrowed
         r = Interest rate as a decimal value
         i = r / 12  for 12 monthly payments per year
         y = number of years
         n = 12 * y  number of monthly payments
         */
        let r = interestRate / 100  // e.g., 4.5 becomes 0.045
        let i = r / 12
        let n = 12 * numberOfYears
        
        let x = pow(1 + i, n)   // = (1 + i) to the power n
        
        monthlyPayment = (amountBorrowed * (i * x)) / (x - 1);
        
        /* Round the calculated monthly payment value to 2 decimal places */
        monthlyPayment = monthlyPayment * 100
        monthlyPayment = round(monthlyPayment)
        monthlyPayment = monthlyPayment / 100
        
        totalInterest = (monthlyPayment * 12 * numberOfYears) - amountBorrowed
        
        /* Round the calculated total interest value to 2 decimal places */
        totalInterest = totalInterest * 100
        totalInterest = round(totalInterest)
        totalInterest = totalInterest / 100
    }
    
}

struct CarLoanCalculator_Previews: PreviewProvider {
    static var previews: some View {
        CarLoanCalculator()
    }
}

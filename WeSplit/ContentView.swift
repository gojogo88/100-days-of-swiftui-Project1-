//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Go on 10/12/19.
//  Copyright © 2019 Jonathan Go. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  
  // commented for challenge 3
  @State private var numberOfPeople = 2
  
  // challenge 3
  @State private var textNumberOfPeople = ""
  
  @State private var tipPercentage = 2
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalAmount: Double {
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    
    let tipValue = orderAmount / 100 * tipSelection
    let grandTotal = orderAmount + tipValue
    
    return grandTotal
  }
  
  var totalPerPerson: Double {
    // calculate the total per person here
    
    // challenge 3
    let peopleCount = Double(textNumberOfPeople) ?? 1
    
    // commented for challenge 3
    //let peopleCount = Double(numberOfPeople + 2)
    
    let amountPerPerson = totalAmount / peopleCount
    
    return amountPerPerson
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
        
          // challenge 3
          TextField("Number of people", text: $textNumberOfPeople)
              .keyboardType(.numberPad)
          
          //commented for challenge 3
          //Picker("Number of people", selection: $numberOfPeople) {
          //  ForEach(2 ..< 100) {
          //    Text("\($0) people")
          //  }
          //}
        }
        
        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        
        // challenge 2
        Section(header: Text("Total Amount")) {
          Text("$\(totalAmount, specifier: "%.2f")")
        }
        
        // challenge 1
        Section(header: Text("Amount per person")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
      }
      .navigationBarTitle("WeSplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//
//  ContentView.swift
//  Conversion
//
//  Created by Gavin Nelson on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    @State private var inputValue = ""
    
    let timeUnits = ["Sec","Minutes","Hours"]
    let measurementUnits: [UnitDuration] = [.seconds, .minutes, .hours]
    
    var result: Double {
        let inputDouble = Double(inputValue) ?? 0.0
    
        let inputMeasurement = Measurement(value: inputDouble, unit: measurementUnits[inputUnit])
        let result = inputMeasurement.converted(to: measurementUnits[outputUnit])
        
        return result.value
       
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack (alignment: .leading, spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Convert from")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Picker("From", selection: $inputUnit) {
                                ForEach(0 ..< timeUnits.count) {
                                    Text(timeUnits[$0])
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("To")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Picker("From", selection: $outputUnit) {
                                ForEach(0 ..< timeUnits.count) {
                                    Text(timeUnits[$0])
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        
                    }
                    
                }
                .padding(.vertical, 8.0)
                
                
                Section {
                    TextField("Ammount", text: $inputValue)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.2f") \(timeUnits[outputUnit])")
                }
                
            }
            
            .navigationTitle("Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

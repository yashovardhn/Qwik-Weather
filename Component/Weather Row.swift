//
//  Weather Row.swift
//  WeatherApp
//
//  Created by Yashovardhn on 14/03/22.
//

import SwiftUI

struct WeatherRow: View {
    // MARK: - Properties
    var logo: String
    var name: String
    var value: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 0, height: 40)
                .padding()
                .background(.white)
                .cornerRadius(50)
            
            VStack {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            } // VStack
        } // HStack
    }
}

// MARK: - Preview
struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8")
    }
}

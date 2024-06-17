//
//  Welcome View.swift
//  WeatherApp
//
//  Created by Yashovardhn on 14/03/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    // MARK: - Properties
    @EnvironmentObject var locationManager: LocationManager
    
    // MARK: - Body
    var body: some View {
        VStack {
            VStack {
                Text("Qwyk Weather")
                    .bold().font(.title)
                
                Text("By YBreezy")
                    .padding()
                    .foregroundColor(.green)
                
            } // VStack
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
            
            Button("Nope") {
                exit(0);
            }
            .cornerRadius(60)
            .symbolVariant(.slash)
            .foregroundColor(.white)
        } // VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

// MARK: - Preview
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


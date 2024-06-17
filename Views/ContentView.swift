//
//  ContentView.swift
//  WeatherApp
//
//  Created by Yashovardhn on 14/03/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await
                                weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        } // VStack
        .background(Image("Image")
                        .aspectRatio(contentMode: .fill))
                        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

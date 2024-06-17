//
//  Weather View.swift
//  WeatherApp
//
//  Created by Yashovardhn on 14/03/22.
//

import SwiftUI

struct WeatherView: View {
    // MARK: - Properties
    var weather: ResponseBody
    
    // MARK: - Body
    var body: some View {
        
        ZStack(alignment: .leading) {
            // MARK: - City and date
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("")
                    Text("")
                    Text("Qwyk Weather")
                        .bold()
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 6)
                        .foregroundColor(.black)
                    
                    Text(weather.name)
                        .bold()
                        .font(.headline)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
                        .fontWeight(.light)
                        .font(.subheadline)
                } // VSTack
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // MARK: - Temperature
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            
                          let x = "\(weather.weather[0].main)"
                            if (x == "Clear")
                            {
                                Image(systemName: "sun.min.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 40))
                            }
                            else if(x == "Haze") {
                                Image(systemName: "sun.haze.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                            }
                            else if(x == "Overcast") {
                                Image(systemName: "cloud.hail")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 40))
                            }
                            else if(x == "Mist") {
                                Image(systemName: "humidity")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                            }
                            else if(x == "Rain") {
                                Image(systemName: "cloud.rain.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 40))
                            }
                            else if(x == "Fog") {
                                Image(systemName: "cloud.fog")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                            }
                            else if(x == "Clouds") {
                                Image(systemName: "cloud.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 40))
                            }

                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    } // HStack
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Spacer()
                } // VStack
                .frame(maxWidth: .infinity)
            } // VStack
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - Weather details
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("More Information")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value:
                                    (weather.main.tempMin
                                    .roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: " Max temp", value:
                                    (weather.main.tempMax
                                    .roundDouble() + "°"))
                    } // HStack
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value:
                                    (weather.wind.speed
                                    .roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "speedometer", name: "Wind Direction", value:
                                    (weather.wind.deg
                                    .roundDouble() ))
                    } // HStack
                    HStack {
                        WeatherRow(logo: "barometer", name: "Pressure", value:
                                    (weather.main.pressure
                                    .roundDouble() + "p"))
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value:
                                    (weather.main.humidity
                                        .roundDouble() + "%"))
                    }//HStack
                    
                    HStack {
                        WeatherRow(logo: "eye", name: "Visibility", value:
                                    (weather.visibility
                                        .roundDouble() + "m"))
                                          Spacer()
                        WeatherRow(logo: "cloud.fill", name: "Clouds", value:
                                    (weather.clouds.all
                                         .roundDouble() + "%"))
                    }//HStack
                    
                } // VStack
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(.black))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            } // VStack
        } // ZStack
        .edgesIgnoringSafeArea(.bottom)
        .background(.cyan)
        .preferredColorScheme(.dark)
    }
}

// MARK: - Preview
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

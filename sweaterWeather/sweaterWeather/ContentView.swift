//
//  ContentView.swift
//  sweaterWeather
//
//  Created by Rian on 24/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cakung, Indonesia")
                
                MainWeatherStatusView(weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temp: 76)
                
                HStack (spacing: 24){
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: "cloud.sun.fill",
                                   temperature: 29)
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.fill",
                                   temperature: 27)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 26)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 27)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonTitle: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: Color.white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var weatherImage: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                
        }
        .padding(.bottom, 60)
    }
}

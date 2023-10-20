//
//  ContentView.swift
//  Weather
//
//  Created by Namish Mamidipalli on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack {
            DayandNight(isNight: $isNight)
            
            VStack {
                CityView(city: "Atlanta, GA")
                
                VStack(spacing: -5) {
                    CurrentWeather(icon: isNight ? "cloud.moon.bolt.fill" : "cloud.sun.fill", temp: 74)
                }
                Spacer()
                
                HStack(spacing: 20) {
                    
                    DayInfo(day: "Tue", temp: 76, icon: "cloud.sun.fill")
                    
                    DayInfo(day: "Wed", temp: 100, icon: "cloud.fill")
                    
                    DayInfo(day: "Thu", temp: 91, icon: "sun.max.fill")
                    
                    DayInfo(day: "Fri", temp: 41, icon: "cloud.snow.fill")
                    
                    DayInfo(day: "Sat", temp: 20, icon: "wind.snow")
                    
                }
                    Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(txt: "Change Day Time", txtcolor: .blue, backgroundcolor: .white)
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct DayInfo: View {
    var day: String
    var temp: Int
    var icon: String
    
    var body: some View {
        VStack(spacing: 7) {
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 29, weight: .medium))
            
            
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .foregroundColor(.white)
                .font(.system(size: 29, weight: .bold))
        }
    }
}

struct DayandNight: View {
    @Binding var isNight: Bool
      
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isNight ? .black : .blue,
            isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityView: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
    
}

struct CurrentWeather: View {
    var icon: String
    var temp: Int
    
    var body: some View {
        Image(systemName: icon)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temp)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
    
}

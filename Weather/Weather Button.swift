//
//  Weather Button.swift
//  Weather
//
//  Created by Namish Mamidipalli on 10/12/23.
//

import SwiftUI

struct WeatherButton: View {
    var txt: String
    var txtcolor: Color
    var backgroundcolor: Color
    var body: some View {
        Text(txt)
            .frame(width: 280, height: 50)
            .foregroundColor(txtcolor)
            .background(backgroundcolor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(20)

    }
}


//
//  WeatherWithAPIApp.swift
//  WeatherWithAPI
//
//  Created by Rian on 26/06/21.
//

import SwiftUI

@main
struct WeatherWithAPIApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}

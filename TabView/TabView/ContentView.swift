//
//  ContentView.swift
//  TabView
//
//  Created by Rian on 26/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RedOneView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            GreenTwoView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            BlueThreeView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shopping Cart")
            }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

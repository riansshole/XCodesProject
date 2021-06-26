//
//  ContentView.swift
//  SwiftLesson
//
//  Created by Rian on 30/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        qlogo()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct qlogo : View {
    var body: some View {
        
        VStack{
            Image("q_logo")
                .resizable()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color("warnaku"))
                .foregroundColor(Color.white)
                .padding()
                .background(Color("warnaku"))
                .cornerRadius(20)
            
            Text("Hello Swift UI")
        }
    }
}

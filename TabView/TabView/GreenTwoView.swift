//
//  GreenTwoView.swift
//  TabView
//
//  Created by Rian on 26/06/21.
//

import SwiftUI

struct GreenTwoView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.green)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(2)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct GreenTwoView_Previews: PreviewProvider {
    static var previews: some View {
        GreenTwoView()
    }
}

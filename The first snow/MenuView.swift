//
//  MenuView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/17/24.
//

import SwiftUI

struct MenuView: View {
    @State var isGameViewPresented = false
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            Image("IMG_2388")
                .resizable()
                .padding(.leading, -37.0)
                .scaledToFill()
                .ignoresSafeArea()
            Button() {
                isGameViewPresented.toggle()
            }
        label:{
            Text("")
                .padding(.top, 600.0)
                .padding(.leading, 36.0)
        }
        }
        .fullScreenCover(isPresented: $isGameViewPresented) {
            GameView()
        }
    }
}

#Preview {
    MenuView()
}

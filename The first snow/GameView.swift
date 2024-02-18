//
//  GameView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/17/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            Image("Mainpage")
                .resizable()
            // .padding(.leading, -37.0)
                .scaledToFit()
            //.ignoresSafeArea()
            
            Button(action: {
                print("well")
            }, label: {
                HStack{
                    Image(systemName: "arrow.backward")
                        .padding(.bottom, 600.0)
                        .padding(.trailing, 350.0)
                        .foregroundColor(.black)
                    
                }
            })
            VStack{
                Text("Follow the ski ⛷️ path to finish the 4 tasks")
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                Text("and click on the sled for a special suprise🎉")
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    
            }
            .padding(.top, 610.0)
            
            
        }
    }
}

#Preview {
    GameView()
}

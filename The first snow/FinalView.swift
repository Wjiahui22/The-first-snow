//
//  FinalView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/17/24.
//

import SwiftUI

struct FinalView: View {
    @State var isPrizeViewPresented = false
    var body: some View {
        ZStack{
            // Color("Background")
            //.ignoresSafeArea()
            //Image("Treasure")
            // .resizable()
            // .padding(.leading, -90.0)
            // .scaledToFill()
            // .ignoresSafeArea()
        }
        VStack{
            Button(action: {
                
                isPrizeViewPresented.toggle()

                
            }, label: {
                
                ZStack {
                    Image("Treasure")
                        .resizable()
                        .padding(.leading, -70.0)
                        .scaledToFill()
                        .ignoresSafeArea()
                }
                
            }
            )
            VStack{
                Text("Click on the treasure box for a special message🎉")
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
            }
            .fullScreenCover(isPresented: $isPrizeViewPresented) {
                EncouragementView()
                
            }
        }
    }
}
            
#Preview {
    FinalView()
}

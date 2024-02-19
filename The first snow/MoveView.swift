//
//  MoveView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/18/24.
//

import SwiftUI

struct MoveView: View {
    @State var isGameViewPresented = false

    var body: some View {
        VStack {
            Button(action: {
                openEnhypenVideo()
            }, label: {
                ZStack {
                    Image("Enhypen")
                        .resizable()
                        .scaledToFit()
                }
            })

            Image("Three")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            

            Button(action: {
                openSeventeenVideo()
            }, label: {
                ZStack {
                    Image("Seventeen")
                        .resizable()
                        .scaledToFit()
                }
            })

            Spacer()
            Spacer()
            
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)

            Button(action: {
                isGameViewPresented.toggle()
            }, label: {
                HStack {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                        .padding(.trailing, 8)

                    Text("Back to Game")
                        .foregroundColor(.black)
                }
            })
            .padding(.bottom, 20)
            .fullScreenCover(isPresented: $isGameViewPresented) {
                GameView()
            }
            Text("Click on Enhypen or Seventeen to learn a cool dance💃")
                .multilineTextAlignment(.center)
            
        }
        
    }

    private func openEnhypenVideo() {
        if let url = URL(string: "https://youtu.be/9MK2OhEo-Zc?si=HamElgbULNaZIJEv") {
            UIApplication.shared.open(url)
        }
    }

    private func openSeventeenVideo() {
        if let url = URL(string: "https://www.youtue.com/shorts/TWvjsC9A9nw?si=0dvG_-w7Aqh5IE1i") {
            UIApplication.shared.open(url)
        }
    }
}

struct MoveView_Previews: PreviewProvider {
    static var previews: some View {
        MoveView()
    }
}

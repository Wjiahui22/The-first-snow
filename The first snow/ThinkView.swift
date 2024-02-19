//
//  ThinkView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/18/24.
//

import SwiftUI

struct TimerView: View {
    @State var isGameViewPresented = false
    @State private var timeRemaining = 3600
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            Image("Four")
                .resizable()
                .scaledToFill()
                .frame(width: 900.0, height: 650)
            
            Text("Your phone is frozen, study for an hour with")
            Text("your buddy to unfreeze it!")
            
            Text("Time Remaining: \(timeString(timeRemaining))")

            Button("Start Timer") {
                startTimer()
            }
            
          
            Button(action: {
                openYouTubeVideo()
            }) {
                Text("Study music")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            
            Spacer()             
            Button(action: {
                isGameViewPresented.toggle()
            }, label: {
                HStack{
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                    
                    Text("Back to Game")
                        .foregroundColor(.black)
                }
            })
            .padding(.bottom, 20)
            
        }
        .padding(.leading, -0.0)
        .ignoresSafeArea()
        .onDisappear {
            timer?.invalidate()
        }
        .fullScreenCover(isPresented: $isGameViewPresented) {
            GameView()
        }
    }

    private func startTimer() {
        if timer == nil || !(timer?.isValid ?? false) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.invalidate()
                }
            }
        }
    }

    private func timeString(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    private func openYouTubeVideo() {
        if let url = URL(string: "https://youtu.be/tK2RdiOlGlE?t=210&si=2yr9BxkVmPBXGwZT") {
            UIApplication.shared.open(url)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

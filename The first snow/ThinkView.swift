//
//  ThinkView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/18/24.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 3600 // 1 hour in seconds
    @State private var timer: Timer?
    @State var isGameViewPresented = false
    var body: some View {
        VStack {
            Image("Four") // Assuming "Four" is the name of your image asset
                .resizable()
                .scaledToFill()
                .frame(width: 900.0, height: 650) // Adjust the height as needed
            
            
            
            Text("Your phone is frozen, study for an hour with")
            Text("your buddy to unfreeze it!")
            //Spacer()
        Text("Time Remaining: \(timeString(timeRemaining))")
                

            Button("Start Timer") {
                startTimer()
            }
           // Spacer() // Add some space between the timer and the button

                       // Separate button for YouTube video
                       Button(action: {
                           openYouTubeVideo()
                       }) {
                           Text("Study music")
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.black)
                               .cornerRadius(10)
                       }
            Button(action: {
                isGameViewPresented.toggle()
            }, label: {
                HStack{
                    Image(systemName: "arrow.backward")
                        .padding(.top, -700.0)
                        .padding(.trailing, 350.0)
                        .foregroundColor(.black)
                    
                }
            })
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
        // Replace "YOUR_VIDEO_ID" with the actual video ID
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

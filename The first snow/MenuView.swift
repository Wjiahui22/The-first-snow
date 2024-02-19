//
//  MenuView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/17/24.
//

import SwiftUI
import AVKit

struct MenuView: View {
    @State private var isGameViewPresented = false
    @State private var audioPlayer: AVPlayer?

    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            Image("IMG_2388")
                .resizable()
                .padding(.leading, -37.0)
                .scaledToFill()
                .ignoresSafeArea()
            
            Button(action: {
                isGameViewPresented.toggle()
                playBackgroundMusic()
            }) {
                Text("Enter") // Empty Text for button
                    .padding(.top, 600.0)
                    .padding(.leading, 36.0)
            }
        }
        .fullScreenCover(isPresented: $isGameViewPresented) {
            GameView()
        }
    }

    private func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "Music", withExtension: "mp3") else {
            print("Error: Couldn't find the audio file.")
            return
        }

        let playerItem = AVPlayerItem(url: url)
        audioPlayer = AVPlayer(playerItem: playerItem)
        audioPlayer?.play()

        // Stop the music after 10 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            audioPlayer?.pause()
            audioPlayer = nil // Release the AVPlayer instance
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

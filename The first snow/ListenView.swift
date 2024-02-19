//
//  ListenView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/18/24.
//
import SwiftUI

struct ListenView: View {
    @State var isGameViewPresented = false
    let spotifyPlaylistURL = URL(string: "https://open.spotify.com/playlist/543Ojvmto8N5oJ0PlwU8Z6?si=l81sIHQVT_Wah5_zEgjNKQ&pi=u-732PS7G5SaGp")!

    var body: some View {
        VStack {
            Image("One")
                .resizable()
                //.padding(.trailing, 50.0)
                .scaledToFit()
                //.ignoresSafeArea()
            ZStack{
                Text("Make a playlist together to share some special winter memories❄️")
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Button(action: {
                //isGameViewPresented.toggle()
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
            
            Button(action: {
                openSpotifyPlaylist()
            }) {
                Text("Open Spotify Playlist")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            .fullScreenCover(isPresented: $isGameViewPresented) {
                GameView()
            }
        }
        
    }

    private func openSpotifyPlaylist() {
        UIApplication.shared.open(spotifyPlaylistURL, options: [:], completionHandler: nil)
    }
}

struct ListenView_Previews: PreviewProvider {
    static var previews: some View {
        ListenView()
    }
}

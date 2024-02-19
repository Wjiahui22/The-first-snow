//
//  PrizeView.swift
//  The first snow
//
//  Created by Jiahui Chen on 2/17/24.
//

import SwiftUI

struct EncouragementView: View {
    let encouragingNotes = [
        "Embrace the frost and shine bright!",
               "Find warmth within winter's chill.",
               "Unique like snowflakes, be yourself.",
               "Chin up! Sparkle in winter night.",
               "Let your heart be a cozy fireplace.",
               "Winter may be cold, but you're warm.",
               "Snow may fall, but barriers crumble.",
               "Winter winds blow, your determination unyielding.",
               "Cooler than an icy breeze, warm hug.",
               "Snowmen may melt, but resilience everlasting."
    ]

    @State private var displayedNote: String = ""
    @State var isGameViewPresented = false
    var body: some View {
        VStack {
            ZStack {
                // Background Image
                Image("Border")
                    .resizable()
                    .padding(.top, 20.0)
                    .ignoresSafeArea()
                    .scaledToFill()
                   
                Text(displayedNote)
                    .padding()
                    .foregroundColor(.black)
                
                Button(action: {
                    isGameViewPresented.toggle()
                }, label: {
                    HStack{
                        Image(systemName: "arrow.backward")
                            .padding(.bottom, 600.0)
                            .padding(.trailing, 350.0)
                            .foregroundColor(.black)
                        
                    }
                })
                
            }
            
            
            Button(action: {
                // Generate a random index to select a note from the array
                let randomIndex = Int.random(in: 0..<self.encouragingNotes.count)
                self.displayedNote = self.encouragingNotes[randomIndex]
            }) {
                Text("Click Here")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
        .padding()
        
        .fullScreenCover(isPresented: $isGameViewPresented) {
            GameView()
        }
    }
    
}


struct EncouragementView_Previews: PreviewProvider {
    static var previews: some View {
        EncouragementView()
    }
}

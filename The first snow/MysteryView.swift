import SwiftUI

struct MysteryView: View {
    let lyricsArray = ["Life is still going on", "I just wanna feel the chemistry", "Tears are falling, falling, falling", "Light up my heart", "Fallin'", "I wish I was a little bit taller", "Stay in the middle", "Just a little bit", "that feeling when I love you", "So it goes, on and on, just like a melody"]
    let artistsArray = ["NCT DREAM", "NCT DREAM", "EXO", "EXO", "SEVENTEEN", "Skee-Lo", "NewJeans", "Enhypen", "Enhypen", "BSS"]

    @State private var currentLyricsIndex = 0
    @State private var userInput = ""
    @State private var score = 0
    @State private var isGameViewPresented = false // Add this state variable

    var body: some View {
        VStack {
            // Background image
            Image("Artist")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
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

                Text("Guess the Artist:")
                    .font(.headline)
                    .padding()

                Text(lyricsArray[currentLyricsIndex])
                    .font(.body)
                    .padding()

                TextField("Type artist name", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Submit") {
                    checkAnswer()
                }
                .padding()

                Text("Score: \(score)")
                    .font(.headline)
                    .padding()

                Button("Next Lyrics") {
                    nextLyrics()
                }
                .padding()

                Spacer()
                Text("There are 10 different lyrics,")
                Text("guess the artists🎤")
            }
            .foregroundColor(.black)
            .padding()
        }
        .padding(.bottom, 300.0)
        .fullScreenCover(isPresented: $isGameViewPresented) {
            GameView()
        }
    }

    private func checkAnswer() {
        let correctArtist = artistsArray[currentLyricsIndex]

        if userInput.lowercased() == correctArtist.lowercased() {
            score += 1
        }

    }

    private func nextLyrics() {
        if currentLyricsIndex < lyricsArray.count - 1 {
            currentLyricsIndex += 1
            userInput = ""
        } else {
            currentLyricsIndex = 0
            score = 0
            userInput = ""
        }
    }
}

struct MysteryView_Previews: PreviewProvider {
    static var previews: some View {
        MysteryView()
    }
}

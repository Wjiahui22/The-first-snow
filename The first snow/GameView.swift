
import SwiftUI

struct GameView: View {
    //going to MenuView
    @State var isMenuViewPresented = false
    @State var isFinalViewPresented = false
    @State var isThinkViewPresented = false
    @State var isMoveViewPresented = false
    @State var isListenViewPresented = false
    @State var isMysteryViewPresented = false
    var body: some View {
        
        HStack {
            Button(action: {
        
                isListenViewPresented.toggle()
            }) {
                Text("Listen")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                isMysteryViewPresented.toggle()

            }) {
                Text("Mystery")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                isMoveViewPresented.toggle()
            }) {
                Text("Move")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            Spacer()
            
            Button(action: {
                isThinkViewPresented.toggle()
            }) {
                Text("Think")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                
            }
        }
                    .padding()
                
        ZStack{
           
            Color("Background")
                .ignoresSafeArea()
            Image("Mainpage")
                .resizable()
                .scaledToFit()
            
            
            Button(action: {
                isMenuViewPresented.toggle()
            }, label: {
                HStack{
                    //arrow going to MenuView button
                    Image(systemName: "arrow.backward")
                        .padding(.bottom, 600.0)
                        .padding(.trailing, 350.0)
                        .foregroundColor(.black)
                    
                }
            })
            
            Button(action: {
                isFinalViewPresented.toggle()
            }, label: {
                ZStack{
                    //Sled going to FinalView button
                    Text("")
                        .font(.system(size: 50))
                        .padding(.trailing, 250.0)
                    
                }
                .padding(.bottom, 450.0)
                
                
            })
            
            Spacer ()
            
            
            VStack{
                //text at the bottom
                Text("Follow the ski ⛷️ path to finish the 4 tasks")
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                //text at the bottom
                Text("and click on the sled for a special suprise🎉")
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
            }
            .padding(.top, 612.0)
            
        }
            // going to MenuView
            .fullScreenCover(isPresented: $isMenuViewPresented) {
                MenuView()
            }
            // going to FinalView
            .fullScreenCover(isPresented: $isFinalViewPresented) {
                FinalView()
            }
            // going to ThinkView
            .fullScreenCover(isPresented: $isThinkViewPresented) {
                TimerView()
            }
            // going to MoveView
            .fullScreenCover(isPresented: $isMoveViewPresented) {
                MoveView()
            }
            // going to ListenView
            .fullScreenCover(isPresented: $isListenViewPresented) {
                ListenView()
            }
            // going to MysteryView
            .fullScreenCover(isPresented: $isMysteryViewPresented) {
                MysteryView()
            }
        }
    }


#Preview {
    GameView()
}

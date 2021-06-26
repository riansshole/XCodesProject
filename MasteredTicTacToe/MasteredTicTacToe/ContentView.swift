//
//  ContentView.swift
//  MasteredTicTacToe
//
//  Created by Rian on 25/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Home()
                .navigationTitle("Tic Tac Toe")
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    // Moves
    @State var moves :[String] = Array(repeating: "", count: 9)
    // To identify the current Player..
    @State var isPlaying = true
    @State var gameOver = false
    @State var msg = ""
    
    var body: some View {
        
        VStack {
            
            // GridView
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                ForEach(0..<9,id: \.self){index in
                    
                    ZStack {
                        
                        // Flip animation
                        
                        Color.blue
                            
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        
                        Text(moves[index])
                            .font(.system(size: 55))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .opacity(moves[index] != "" ? 1 : 0)
                    }
                    .frame(width: getWidth(), height: getWidth())
                    .cornerRadius(15)
                    .rotation3DEffect(
                        .init(degrees: moves[index] != "" ? 180 : 0),
                        axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
                        anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                        anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
                        perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
                    )
                    // Whenever tapped adding moves..
                    .onTapGesture(perform: {
                        
                        withAnimation(Animation.easeIn(duration: 0.5)) {
                            
                            if moves[index] == "" {
                                moves[index] = isPlaying ? "X" : "O"
                                //Updating player
                                isPlaying.toggle()
                            }
                        }
                    })
                }
            }
            .padding(15)
        }
        // Whenever moves updated it will check for winner
        .onChange(of: moves, perform: { value in
            checkWinner()
        })
        .alert(isPresented: $gameOver, content: {
            
            Alert(title: Text("Winner"), message: Text(msg), dismissButton: .destructive(Text("Play Again?"), action: {
                
                // resetting all data
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    
                    moves.removeAll()
                    moves = Array(repeating: "", count: 9)
                    isPlaying = true
                }
            }))
        })
    }
    // calculating width..
    
    func getWidth() -> CGFloat {
        
        // Horizontal padding = 30
        // spacing = 30
        let width = UIScreen.main.bounds.width - (30 + 30)
        
        return width / 3
    }
    
    //checking for winner
    
    func checkWinner() {
        
        if checkMoves(Player: "X") {
            
            //Promoting Alert View..
            
            msg = "Player X Won !!!"
            gameOver.toggle()
            
        }
        else if checkMoves(Player: "O") {
            
            msg = "Player O Won !!"
            gameOver.toggle()
        }
        else {
            
            // Checking no moves
            
            let status = moves.contains { (value) -> Bool in
                
                return value = ""
            }
            
            if !status {
                
                msg = "Game Over Tied !!"
                gameOver.toggle()
            }
        }
    }
    
    func checkMoves(Player: String) -> Bool {
        
        // Horizontal Moves
        
        for i in stride(from: 0, to: 9, by: 3) {
            
            if moves[i] == Player && moves[i + 1] == Player && moves[ i + 2 ] == Player{
                return true
            }
        }
        
        // Vertical Moves
        for i in 0...2 {
            
            if moves[i] == Player && moves[ i + 3 ] == Player && moves[ i + 6 ] == Player{
                return true
            }
        }
        
        // Diagonal Moves
        
        if moves[0] == Player && moves[4] == Player && moves[8] == Player {
            return true
        }
        
        if moves[2] == Player && moves[4] == Player && moves[6] == Player {
            return true
        }
        
        return false
    }
}

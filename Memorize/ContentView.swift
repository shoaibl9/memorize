//
//  ContentView.swift
//  Memorize
//
//  Created by Shoaib Laghari on 10/16/21.
//

import SwiftUI

//Main view
struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            Text("Memorize Game")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(.black)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach (viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            HStack {
                halloween
                Spacer()
                thanksgiving
                Spacer()
                christmas
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)

    }
    
    var halloween: some View {
        Button {
            viewModel.newGame("halloween")
        } label: {
            ZStack {
                Text("🎃")
                    .font(.largeTitle)
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
    
    var thanksgiving: some View {
        Button {
            viewModel.newGame("thanksgiving")
        } label: {
            ZStack {
                Text("🦃")
                    .font(.largeTitle)
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
    
    var christmas: some View {
        Button {
            viewModel.newGame("christmas")
        } label: {
            ZStack {
                Text("🎄")
                    .font(.largeTitle)
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

//Single card
struct CardView : View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingContants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingContants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(DrawingContants.opacity)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingContants.fontScale)
    }
    
    private struct DrawingContants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let opacity: Double = 0
        static let fontScale: CGFloat = 0.8
    }
}

// Preview light and dark mode
struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

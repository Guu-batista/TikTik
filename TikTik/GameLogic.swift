//
//  GameLogic.swift
//  TikTik
//
//  Created by Gustavo Batista on 15/04/24.
//

import Foundation

enum Player{
    case x
    case o
}

class tiktikModel: ObservableObject{
    
    @Published var board:[Player?] = Array(repeating: nil, count: 9)
    @Published var activePlayer: Player = .x
    @Published var winner:Player? = nil
    @Published var jogadas: [Int] = []
    @Published var scorePlayer1: Int = 0
    @Published var scorePlayer2: Int = 0
    
    func buttonTapped(i: Int) {
            guard winner == nil else {
                return
            }
            
            // Verifica se o espaço está vazio
            if board[i] == nil {
                jogadas.append(i)
                if jogadas.count >= 7 {
                    if let primeiraJogada = jogadas.first {
                        board[primeiraJogada] = nil
                    }
                    jogadas.remove(at: 0)
                }
                
                // Preenche o espaço selecionado com o jogador ativo
                board[i] = activePlayer
                if checkWinner() {
                    // Existe um vencedor
                    winner = activePlayer
                    updateScore()
                } else {
                    // Alterna para o próximo jogador
                    activePlayer = (activePlayer == .x) ? .o : .x
                }
            }
        }
    
    
    //Label displayed
    func buttonLabel(i:Int) -> String{
        if let player = board[i]{
            return player == .x ? "X" : "O"
        }
        return ""
    }
    
    
    //reset Game
    func resetGame() {
        board = Array(repeating: nil, count:9)
        jogadas.removeAll()
        winner = nil
        print("resetei o game")
    }
    
    
    // check for winner
    func checkWinner() -> Bool {
        //rows
        for i in stride(from: 0, to: 9, by: 3 ){
            if board[i] == activePlayer && board[i+1] == activePlayer && board[i+2] == activePlayer {
                return true
            }
        }
        //collums
        for i in 0..<3 {
            if board[i] == activePlayer && board[i+3] == activePlayer && board[i+6] == activePlayer {
                return true
            }
        }        //diagonals
        if board[0] == activePlayer && board[4] == activePlayer && board[8] == activePlayer{
            return true
        }
        if board[2] == activePlayer && board[4] == activePlayer && board[6] == activePlayer{
            return true
        }
        return false
    }
    
    // Update Winner Score
    func updateScore() {
        if let winner = self.winner{
            switch winner {
                      case .x:
                          scorePlayer1 += 1
                print("\(scorePlayer1)")
                      case .o:
                          scorePlayer2 += 1
                print("\(scorePlayer2)")
                      }
        }
    }
    
}

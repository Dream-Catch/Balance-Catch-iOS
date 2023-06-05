//
//  PlayerModel.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/04/02.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var select: Int
}

class PlayerList: ObservableObject {
    @Published var players: [Player]
    
    init(players: [Player] = []) {
        self.players = players
    }
    
    func addPlayer(name: String) {
        let player = Player(name: name,select : -1)
        players.append(player)
    }
    
    func resetPlayers() {
        players.removeAll()
    }
}

//
//  PlayerModel.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/04/02.
//

import Foundation

struct Player {
    var id: Int
    var name: String
}

class PlayerList: ObservableObject {
    @Published var players: [Player] = []

    func addPlayer(name: String) {
        let id = players.count
        let player = Player(id: id, name: name)
        players.append(player)
    }

    func resetPlayers(count: Int) {
        players = (0..<count).map { Player(id: $0, name: "Player \($0 + 1)") }
    }
}

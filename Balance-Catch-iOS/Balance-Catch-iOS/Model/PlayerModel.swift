//
//  PlayerModel.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/04/02.
//

import Foundation

enum SelectType {
    case first, second, none
}

struct Player {
    var index: Int
    var name: String
    var selectType: SelectType
}

class PlayerList: ObservableObject {
    @Published var players: [Player]
    
    init(players: [Player] = []) {
        self.players = players
    }
    
    func addPlayer(index: Int,
                   name: String) {
        let player = Player(index: index,
                            name: name,
                            selectType : .none)
        players.append(player)
    }
    
    func resetPlayers() {
        players.removeAll()
    }
}

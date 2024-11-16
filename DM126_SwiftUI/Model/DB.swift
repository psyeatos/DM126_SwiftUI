//
//  DB.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/9/24.
//

import Foundation

let servicesMock : [ServiceType]=[
    ServiceType(id: 1, nome: "Bulbasaur", imagem: "bulbasaur"),
    ServiceType(id: 2, nome: "Ivysaur", imagem: "ivysaur"),
    ServiceType(id: 3, nome: "Venusaur", imagem: "venusaur"),
    ServiceType(id: 4, nome: "Mewtwo", imagem: "mewtwo"),
    ServiceType(id: 5, nome: "Mew", imagem: "mew"),
]

let goalMock : [GoalType] = [GoalType(id: 1, icone: "checkmark", titulo: "Pegar os iniciais", descricao: "Bulbasaur, Squirtle e Charmander"),
                             GoalType(id: 2, icone: "checkmark", titulo: "Evoluir os iniciais", descricao: "Venusaur, Blastoise e Charizard"),
                             GoalType(id: 3, icone: "checkmark", titulo: "Pegar um pokemon mitico", descricao: "Mew"),
                             GoalType(id: 4, icone: "checkmark", titulo: "Completar a pokedex", descricao: "Pegar todos pokemons")]

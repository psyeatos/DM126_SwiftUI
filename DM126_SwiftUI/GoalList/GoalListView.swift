//
//  GoalListView.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/15/24.
//

import SwiftUI

struct GoalListView: View {
    let goal : GoalType
    var body: some View {
        HStack{
            Image(systemName: goal.icone).font(.largeTitle)
            VStack(alignment: .leading){
                Text(goal.titulo).font(.headline)
                Text(goal.descricao).font(.subheadline)
            }
        }.foregroundStyle(.teal)

    }
}

#Preview {
    GoalListView(goal: GoalType(id: 1, icone: "checkmark", titulo: "Pegar os iniciais", descricao: "Bulbasaur, Squirtle e Charmander"))
}

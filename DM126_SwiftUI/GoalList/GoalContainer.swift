//
//  GoalContainer.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/15/24.
//

import SwiftUI

struct GoalContainer: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            ForEach(goalMock){
                goal in GoalListView(goal: goal)
            }
        }
    }
}

#Preview {
    GoalContainer()
}

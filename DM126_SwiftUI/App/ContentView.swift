//
//  ContentView.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationBar()
        ScrollView{
            VStack(spacing:50){
                FeatureGrid()
                CarroselTabView().frame(minHeight: 200)
                GoalContainer()
            } .padding()
        }
    }
}

#Preview {
    ContentView()
}

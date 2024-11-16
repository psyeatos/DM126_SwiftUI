//
//  NavigationBar.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/9/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Button("Teste"){
                
            }
            .font(.headline)
            .fontWeight(.bold)
            Button(action:{}){
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}

#Preview {
    NavigationBar()
}

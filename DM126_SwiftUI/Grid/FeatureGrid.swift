//
//  FeatureGrid.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/9/24.
//

import SwiftUI

struct FeatureGrid: View {
    
    var body: some View {
        LazyHGrid(rows: [GridItem(.fixed(100)),
                         GridItem(.fixed(100)),
                         GridItem(.fixed(100))]){
            ForEach(servicesMock){service in Text(service.nome)}
        }
    }
    
}

#Preview {
    FeatureGrid()
}

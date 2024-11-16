//
//  FeatureType.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/15/24.
//

import SwiftUI

struct FeatureType: View {
    
    let service : ServiceType
    
    var body: some View {
        VStack{
            Image(service.imagem).resizable().scaledToFit().cornerRadius(20).fixedSize(horizontal: false, vertical: true)
            Text(service.nome).font(.system(size: 20))
        }.frame(width: 90, height: 90)
    }
}

#Preview {
    FeatureType(service: ServiceType(id: 1, nome: "Bulbasaur", imagem: "bulbasaur"))
}

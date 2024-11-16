//
//  CarroselItemView.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/15/24.
//

import SwiftUI

struct CarroselItemView: View {
    var banner: ServiceType
    var body: some View {
        Image(banner.imagem).resizable().scaledToFit().cornerRadius(20)
    }
}

#Preview {
    CarroselItemView(banner: ServiceType(id: 1, nome: "", imagem: "charizard"))
}

//
//  CarroselTabView.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/15/24.
//

import SwiftUI

struct CarroselTabView: View {
    let bannerList: [ServiceType] = [ServiceType(id: 1, nome: "", imagem: "charmander"),
                                     ServiceType(id: 2, nome: "", imagem: "charmeleon"),
                                     ServiceType(id: 3, nome: "", imagem: "charizard"),]
    var body: some View {
        TabView{
            ForEach(bannerList){
                banner in CarroselItemView(banner: banner)
            }
        }.frame(width: 250).tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarroselTabView()
}

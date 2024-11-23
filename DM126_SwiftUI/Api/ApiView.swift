//
//  ApiView.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/23/24.
//

import SwiftUI

struct ApiView: View {
    @State private var userInput = ""
    @State private var fetchedName = ""
    @State private var fetchedImageURL = ""
    @State private var isLoading = false
    @State private var showError = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Pokedex")
                .font(.title)
            
            TextField("Digite id ou nome do pokemon", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("* use letras minusculas, caso for digitar o nome")
                .font(.system(size: 15))
            
            Button(action: fetchData) {
                Text("Buscar")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(userInput.isEmpty)
            if isLoading {
                ProgressView()
            }
            
            if !fetchedName.isEmpty {
                Text("Nome: \(fetchedName)")
                    .font(.headline)
                
                if let url = URL(string: fetchedImageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            
            if showError {
                Text("Erro ao buscar dados.")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
    func fetchData() {
        guard let encodedInput = userInput.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(encodedInput)") else {
            showError = true
            return
        }
        
        isLoading = true
        showError = false
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    print("Erro: \(error.localizedDescription)")
                    showError = true
                    return
                }
                
                guard let data = data else {
                    showError = true
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print(result)
                    fetchedName = result.name
                    fetchedImageURL = result.sprites.other.officialArtwork.frontDefault
                } catch {
                    print("Erro ao decodificar: \(error)")
                    showError = true
                }
            }
        }
        
        task.resume()
    }
}

struct APIResponse: Codable {
    let name: String
    let sprites: Sprites
    
    struct Sprites: Codable {
        let other: Other
        
        struct Other: Codable {
            let officialArtwork: OfficialArtwork
            
            enum CodingKeys: String, CodingKey {
                case officialArtwork = "official-artwork"
            }
            
            struct OfficialArtwork: Codable {
                let frontDefault: String
                
                enum CodingKeys: String, CodingKey {
                    case frontDefault = "front_default"
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

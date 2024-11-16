//
//  NavigationBar.swift
//  DM126_SwiftUI
//
//  Created by user270465 on 11/9/24.
//

import SwiftUI

struct NavigationBar: View {
    @State private var isModalPresented = false
    @State private var isListPresented = false
    @State private var userInput = ""
    @State private var userInputs: [String] = []
    var body: some View {
        HStack{
            Button(action: {
                            isListPresented = true
                        }) {
                            Text("\(userInput.isEmpty ? "user" : userInput)")
                                .font(.title)
                        }
            Button(action: {
                isModalPresented = true
            }){
                Image(systemName: "plus.circle.fill")
            }
        }.padding()
            .sheet(isPresented: $isModalPresented) {
                ModalView(text: $userInput, onSave: { input in
                    userInputs.append(input)
                })
            }
            .sheet(isPresented: $isListPresented) {
                        InputListView(inputs: userInputs) { selectedInput in
                            userInput = selectedInput
                        }
                    }
    }
}

struct ModalView: View {
    @Binding var text: String
    var onSave: (String) -> Void

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Adicione um usuario")
                .font(.headline)
            
            TextField("Digite seu nome", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if !text.isEmpty {
                    onSave(text)
                }
                dismiss()
            }) {
                Text("Salvar")
                    .font(.headline)
                    .padding()
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct InputListView: View {
    let inputs: [String]
    var onSelect: (String) -> Void

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List(inputs, id: \.self) { input in
                            Button(action: {
                                onSelect(input)
                                dismiss()
                            }) {
                                Text(input)
                                    .padding()
                            }
                        }            .navigationTitle("Lista de usuarios")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fechar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
#Preview {
    NavigationBar()
}

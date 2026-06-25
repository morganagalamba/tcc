//
//  ContentView.swift
//  tcc
//
//  Created by Morgana Galamba on 29/12/25.
//

import SwiftUI
import AccessiblePreview
import CodeForAll

struct ContentView: View {
    @State var scale: CGFloat = 1
    @State private var searchText = ""
        
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.red)
                    TextField("O que vai pedir hoje?", text: $searchText)
                        .frame(height: 24)
                        
                }
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
                .padding(.horizontal)
                .contentShape(Rectangle())
                .accessibilityElement(children: .combine)
                
                LazyVGrid(columns: columns, spacing: 12) {
                    CategoryButton(title: "", icon: "cart.fill", color: Color(red: 0.2, green: 0.7, blue: 0.3))
                    CategoryButton(title: "Farmácia", icon: "pills.fill", color: Color(red: 1.0, green: 0.4, blue: 0.4))
                    CategoryButton(title: "", icon: "pawprint.fill", color: Color(red: 0.6, green: 0.4, blue: 0.8))
                    CategoryButton(title: "Bebidas", icon: "wineglass.fill", color: Color(red: 1.0, green: 0.7, blue: 0.2))
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        
    }
    
    
}

struct CategoryButton: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        Button(action: { print("Clicou em \(title)") }) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.opacity(0.15))
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .foregroundColor(color)
                    }
                }
                .padding(12)
            }
            .frame(height: 100)
        }
        
    }
}

#Preview {
    ContentView()
}

#Preview(trait: .buttonTapArea) {
    ContentView()
}

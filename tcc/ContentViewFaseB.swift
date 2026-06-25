//
//  ContentViewFaseB.swift
//  tcc
//
//  Fase B do experimento: replicação da interface do iFood usando os
//  componentes da biblioteca CodeForAll (ZARZAR, 2024) e a auditoria
//  visual de AccessiblePreview (SANTOS NETO, 2024).
//
//  IMPORTANTE: a API exata da CodeForAll (assinatura dos inicializadores
//  de FATextField, FAImageButton, FADescriptiveImage e FAText) foi
//  inferida a partir do texto da monografia de Zarzar (2024). Se algum
//  parâmetro divergir da implementação real no pacote, ajuste localmente.
//  Os pontos sensíveis estão marcados com // API:
//

import SwiftUI
import AccessiblePreview
import CodeForAll

struct ContentViewFaseB: View {
    @State private var searchText = ""

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // MARK: - Barra de busca (FATextField)
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.red)
                        .accessibilityHidden(true)

                    FATextField(
                        label: FAText("O que vai pedir hoje?"),
                        receivedText: $searchText,
                        isMandatory: false
                    )
                    .frame(height:20)
                }
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
                .padding(.horizontal)

                LazyVGrid(columns: columns, spacing: 12) {
                    AccessibleCategoryButton(
                        title: "Mercado",
                        icon: "cart.fill",
                        color: Color(red: 0.2, green: 0.7, blue: 0.3),
                        accessibilityDescription: "Categoria Mercado, abre lista de supermercados próximos"
                    )
                    AccessibleCategoryButton(
                        title: "Farmacia",
                        icon: "pills.fill",
                        color: Color(red: 1.0, green: 0.4, blue: 0.4),
                        accessibilityDescription: "Categoria Farmácia, abre lista de farmácias próximas"
                    )
                    AccessibleCategoryButton(
                        title: "Petshop",
                        icon: "pawprint.fill",
                        color: Color(red: 0.6, green: 0.4, blue: 0.8),
                        accessibilityDescription: "Categoria Petshop, abre lista de pet shops próximos"
                    )
                    AccessibleCategoryButton(
                        title: "Bebidas",
                        icon: "wineglass.fill",
                        color: Color(red: 1.0, green: 0.7, blue: 0.2),
                        accessibilityDescription: "Categoria Bebidas, abre lista de adegas e mercados de bebidas"
                    )
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}

// MARK: - Card de categoria acessível
struct AccessibleCategoryButton: View {
    let title: String
    let icon: String
    let color: Color
    let accessibilityDescription: String

    var body: some View {
        Button(action: { print("Clicou em \(title)") }) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.opacity(0.15))
                
                VStack(alignment: .leading) {
                    FAText(title)
                        .foregroundColor(.black)
                    Spacer()
                    HStack{
                        Spacer()
                        FADescriptiveImage(icon, imageAccessibilityDescription: accessibilityDescription, isSystemImage: true)
                        .foregroundColor(color)
                    }
                }
                .padding(12)
            }
            .frame(height: 100)
        }
    }
}

// MARK: - Previews
#Preview("Fase B - padrão") {
    ContentViewFaseB()
}

#Preview(trait: .buttonTapArea) {
    ContentViewFaseB()
}


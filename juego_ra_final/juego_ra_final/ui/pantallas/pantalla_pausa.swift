//
//  pantalla_pausa.swift
//  juego_ra
//
//  Created by alumno on 11/26/25.
//

import SwiftUI
 
struct PantallaPausa: View {
    var onReanudar: () -> Void
    var onMenu: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Pausa")
                .font(.largeTitle)
                .bold()
 
            Button("Reanudar") {
                onReanudar()
            }
            .font(.title2)
            .padding()
            .background(Color.green.opacity(0.8))
            .cornerRadius(12)
            .foregroundColor(.white)
 
            Button("Ir al Menú") {
                onMenu()
            }
            .font(.title2)
            .padding()
            .background(Color.red.opacity(0.8))
            .cornerRadius(12)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.6))
        .ignoresSafeArea()
    }
}
 

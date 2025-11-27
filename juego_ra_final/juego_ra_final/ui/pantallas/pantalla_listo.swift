//
//  PantallaListo.swift
//  juego_ra
//
//  Created by alumno on 21-11-25.
//

import SwiftUI

struct PantallaListo: View {

    @State private var navegarAPrincipal = false
    
    

    var body: some View {
        ZStack {
            // Fondo degradado de negro a azul
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Spacer()

                // Texto descriptivo
                Text("Si estás listo para adentrarte en el peligro, pica la lupa")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                
                // Lupa en el centro
                Button {
                    navegarAPrincipal = true
                } label: {
                    Image("lupa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .shadow(radius: 10)
                }
                .padding(.top, 100)
                
                Spacer()

                // Botón de regreso al menú
                NavigationLink(destination: PantallaInicio()) {
                    Text("MENÚ")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(12)
                }
                .padding(.bottom, 40)
            }

            // Navegación condicional a PantallaPrincipalRA cuando el usuario presiona la lupa
            NavigationLink(destination: PantallaPrincipal(), isActive: $navegarAPrincipal) {
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        PantallaListo()
    }
}

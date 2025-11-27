//
//  PantallaAcertijo.swift
//  juego_ra
//
//  Created by alumno on 26-11-25.
//

import SwiftUI

struct PantallaAcertijo: View {
    
    let titulo: String
    let texto: String
    let onContinuar: () -> Void
    let imagen: String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Espaciado superior para centrar la caja
                Spacer()
                
                // Caja principal
                VStack(spacing: 20) {
                    // Título
                    Text(titulo)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    // Texto del acertijo
                    Text(texto)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40) // Espacio horizontal alrededor del texto
                    
                    // Imagen de referencia
                    Image(imagen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250) // Tamaño de la imagen
                        .padding(.top, 20) // Espaciado superior de la imagen
                    
                    // Botón de continuar
                    Button(action: onContinuar) {
                        Text("CONTINUAR")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240) // Tamaño del botón
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(25)
                    }
                    .padding(.top, 20)
                }
                .frame(maxWidth: .infinity) // Hace que la caja se expanda completamente en el ancho
                .padding(30) // Relleno alrededor de la caja para separarla de los bordes
                .background(Color.black.opacity(0.75))
                .cornerRadius(30)
                .shadow(radius: 20)
                
                // Espaciado inferior para centrar la caja
                Spacer()
            }
        }
        .ignoresSafeArea() // Asegura que el fondo negro cubra toda la pantalla
    }
}

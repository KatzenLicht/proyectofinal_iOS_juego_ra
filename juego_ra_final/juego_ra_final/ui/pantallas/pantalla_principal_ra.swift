//
//  PantallaPrincipal.swift
//  juego_ra
//
//  Created by alumno on 12-11-25.
//

import SwiftUI
import CoreLocation

struct PantallaPrincipal: View {
    
    @State var proveedor_ubicacion = ServicioUbicacion()
    @State private var indicePistaActual = 0
    @State private var mostrarAcertijo = false
    @State private var estaPausado = false
    @Environment(\.dismiss) private var dismiss
    
    // Timer para revisar la ubicación periódicamente (evita poner lógica en el body)
    private let ubicacionTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    private var pistaActual: Pista {
        if indicePistaActual >= 0 && indicePistaActual < pistas.count {
            return pistas[indicePistaActual]
        } else {
            return pistas.first!
        }
    }
    
    var body: some View {
        
        ZStack {
            
            VistaCamara()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.spring()) {
                            estaPausado = true
                        }
                    }) {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 32))
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .clipShape(Circle())
                            .shadow(radius: 8)
                    }
                    .padding(.top, 20)
                    .padding(.trailing, 20)
                }
                
                Spacer()
                
                Group {
                    let pista = pistaActual
                    
                    let distancia = Int(proveedor_ubicacion.ubicacion_actual?.distance(from: pista.ubicacion) ?? -1)
                    
                    if distancia >= 0 {
                        if !pista.puede_ser_recogida(ubicacion: proveedor_ubicacion.ubicacion_actual) {
                            Text("Distancia a la pista: \(distancia) m")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                        } else {
                            Text("Estás muy cerca de la pista. Esperando acertijo...")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                        }
                    } else {
                        Text("Buscando ubicación... Activa el GPS")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
            }
            
            if mostrarAcertijo {
                let texto = pistaActual.cuerpo.informacion
                
                // Desempaquetamos la imagen de manera segura
                let imagen = pistaActual.cuerpo.imagen ?? "defaultImage" // Puedes usar una imagen por defecto si es nil
                
                // Pasamos los parámetros en el orden correcto
                PantallaAcertijo(
                    titulo: "Acertijo",
                    texto: texto,
                    onContinuar: {
                        withAnimation(.spring()) {
                            mostrarAcertijo = false
                            if indicePistaActual < pistas.count - 1 {
                                indicePistaActual += 1
                            } else {
                                dismiss()
                            }
                        }
                    },
                    imagen: imagen  // Pasamos la imagen
                )
                .transition(.opacity.combined(with: .scale))
                .zIndex(20)
            }
            
            // -------- PAUSA --------
            if estaPausado {
                PantallaPausa(
                    onReanudar: {
                        withAnimation(.spring()) {
                            estaPausado = false
                        }
                    },
                    onMenu: {
                        withAnimation(.spring()) {
                            estaPausado = false
                            dismiss()
                        }
                    }
                )
                .transition(.opacity)
                .zIndex(30)
            }
        }
        .onReceive(ubicacionTimer) { _ in
            revisarSiMostrarAcertijo()
        }
        .onDisappear {
            ubicacionTimer.upstream.connect().cancel()
        }
    }
    
    private func revisarSiMostrarAcertijo() {
        guard !mostrarAcertijo else { return }
        
        guard let ubicacion = proveedor_ubicacion.ubicacion_actual else { return }
        
        if pistaActual.puede_ser_recogida(ubicacion: ubicacion) {
            DispatchQueue.main.async {
                self.mostrarAcertijo = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        PantallaPrincipal()
    }
}

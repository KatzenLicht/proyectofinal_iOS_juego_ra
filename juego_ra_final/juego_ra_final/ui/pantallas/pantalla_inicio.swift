import SwiftUI

struct PantallaInicio: View {
    
    @State private var mostrarFooter = true
    
    var body: some View {
        NavigationStack {  // Añadido NavigationStack aquí
            ZStack {
                
                Image("fondo")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink(destination: PantallaListo()) {
                            Text("JUGAR")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 250, height: 50)
                                .background(Color.black.opacity(0.6))
                                .cornerRadius(20)
                        }
                        
                        NavigationLink(destination: PantallaCreditos()) {
                            Text("CRÉDITOS")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 250, height: 50)
                                .background(Color.black.opacity(0.6))
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    if mostrarFooter {
                        HStack {
                            Spacer()
                            Text("© 2025 Juego RA")
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                            Spacer()
                        }
                        .background(Color.black.opacity(0.1))
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaInicio()
}

//
//  VistaParticulas.swift
//  juego_ra
//
//  Created by alumno on 11/24/25.
//


import SwiftUI

struct VistaParticulas: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    FondoParticula()
}

struct Particula: Identifiable{
    let id = UUID()
    var position: CGPoint
    var color: Color
    var size: CGFloat
    var speed: CGFloat
    var opacity: Double
}

struct FondoParticula: View {
    @State private var particulas: [Particula] = []
    let timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            ForEach(particulas) { particula in
                Circle()
                    .fill(particula.color)
                    .frame(width: particula.size)
                    .position(particula.position)
                    .opacity(particula.opacity)
            }
        }
        .onReceive(timer){ _ in
            crearParticula()
            actualizarParticula()
        }
    }
    
    private func crearParticula(){
        let nuevaParticula = Particula(
            position: CGPoint(
                x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                y: UIScreen.main.bounds.height + 50
            ),
            color: [.white, .red, .purple, .green].randomElement()!,
            size: CGFloat.random(in: 2...8),
            speed: CGFloat.random(in: 2...10),
            opacity: 5
        )
        particulas.append(nuevaParticula)
    }
    
    private func actualizarParticula(){
        particulas = particulas.compactMap({ particula in
            var particulaActualizada = particula
            particulaActualizada.position.y -= particulaActualizada.speed
            particulaActualizada.opacity -= 0.01
            return particulaActualizada.opacity > 0 ? particulaActualizada : nil
        })
    }
}

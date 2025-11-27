//
//  pantalla_creditos.swift
//  juego_ra
//
//  Created by alumno on 11/24/25.
//

import SwiftUI

struct PantallaCreditos: View{
    var body: some View{
        ZStack{
            FondoParticula()
            VStack{
                Spacer()
                Text("Proyecto final iOS")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                Text("Profesor. Fernando Humberto Gallegos Borunda")
                    .font(.system(size: 29))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Text("Colaboradores:")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                Text("Oscar Alejandro Martinez Bernal")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Julian de Jesus Lagunes Aleman")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Paulo Vinicio Hernández Arceo")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                NavigationLink(destination: PantallaInicio()) {
                    Text("MENÚ")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(12)
                }.padding(.bottom, 40)
            }
        }
    }
}
#Preview {
    PantallaCreditos()
}

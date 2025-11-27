//
//  cuerpo_pista.swift
//  juego_ra
//
//  Created by alumno on 05-11-25.
//

enum TiposDePista {
    case informacion
    case interactiva
}

protocol CuerpoPista {
    var tipo: TiposDePista { get set }
    var informacion: String { get set }
    var imagen: String? { get set }  // Agregar la propiedad de la imagen
}

struct PistaInformacion: CuerpoPista {
    var tipo = TiposDePista.informacion
    var informacion: String
    var imagen: String?  // La imagen será opcional (puede ser nil en algunos casos)
}

struct PistaInteractuable: CuerpoPista {
    var tipo = TiposDePista.interactiva
    var informacion: String
    var imagen: String?  // También agregamos imagen aquí
    var interacciones: [Boton]
}

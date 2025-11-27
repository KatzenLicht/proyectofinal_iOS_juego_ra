//
//  datos_pistas.swift
//  juego_ra
//
//  Created by alumno on 05-11-25.
//

import CoreLocation

let pistas: [Pista] = [

    // 1 — Edificio C
    Pista(
        ubicacion: CLLocation(latitude: 31.7425158, longitude: -106.4323544),
        id: "pista_1",
        cuerpo: PistaInformacion(
            informacion: "Nacen de la creatividad y terminan en una pasarela. Entre telas, agujas y trazos, aquí se les da vida. ¿Qué edificio soy?",
            imagen: "vestido" // Imagen para esta pista
        )
    ),
    
    // 2 — Edificio V
    Pista(
        ubicacion: CLLocation(latitude: 31.7420835, longitude: -106.4324204),
        id: "pista_2",
        cuerpo: PistaInformacion(
            informacion: "Donde el diseño cobra vida y el corazón del campus palpita, ¿qué edificio soy?",
            imagen: "dinero" // Imagen para esta pista
        )
    ),
    
    // 3 — Edificio B
    Pista(
        ubicacion: CLLocation(latitude: 31.7425611, longitude: -106.4326246),
        id: "pista_3",
        cuerpo: PistaInformacion(
            informacion: "Donde los edificios se planean pero no pasan del papel, ¿qué edificio soy?",
            imagen: "mapa" // Imagen para esta pista
        )
    ),
    
    // 4 — Edificio A
    Pista(
        ubicacion: CLLocation(latitude: 31.742058, longitude: -106.433219),
        id: "pista_4",
        cuerpo: PistaInformacion(
            informacion: "Felicidades, resolviste el misterio, no hay nada, solo perdiste tu tiempo, ánimo :)",
            imagen: "emoji" // Imagen para esta pista
        )
    )
]


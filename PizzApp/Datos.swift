//
//  Datos.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 5/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import Foundation

class Pizza {
    
    let tamañoDePizza : [String] = ["Pequeña","Mediana","Familiar"]
    let tipoDeMasa : [String] = ["Clásica","Fina","Pan"]
    let tipoDeQueso : [String] = ["Mozzarela","Chedar","Parmesano","Sin Queso"]
    let tipoDeIngredientes : [String] = ["Jamón","Pepperoni","Pavo","Salchicha","Aceituna","Cebolla","Pimiento","Piña","Bacon","Champiñon","Atún"]
    
    func devuelveIngredienteSeleccionado(ingrediente :Int)->String{
        
        if ingrediente == -1{
            return "No seleccionado"
        }else{
           return self.tipoDeIngredientes[ingrediente]
        }
    }
}

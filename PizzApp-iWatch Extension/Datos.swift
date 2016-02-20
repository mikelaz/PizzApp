//
//  Datos.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 20/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
        
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

class Pedido: NSObject {
        
    var tamañoSeleccionado : Int = 0
    var masaSeleccionada : Int = 0
    var quesoSeleccionado : Int = 0
    var ingrediente1 :Int = -1
    var ingrediente2 :Int = -1
    var ingrediente3 :Int = -1
    var ingrediente4 :Int = -1
    var ingrediente5 :Int = -1
    
}


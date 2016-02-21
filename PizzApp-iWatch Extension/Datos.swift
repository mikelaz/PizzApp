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
            return "No selec."
        }else{
            return self.tipoDeIngredientes[ingrediente]
        }
    }
}

class Pedido: NSObject {
        
    var tamañoSeleccionado : Int = 0
    var masaSeleccionada : Int = 0
    var quesoSeleccionado : Int = 0
    var ingredientes :[Int] = [-1,-1,-1,-1,-1]
    
}


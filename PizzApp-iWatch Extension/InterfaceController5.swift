//
//  InterfaceController5.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 20/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController5: WKInterfaceController {

    
    let pizza = Pizza()
    var configuracion = Pedido ()
    
    @IBOutlet var labelTamaño: WKInterfaceLabel!
    @IBOutlet var labelMasa: WKInterfaceLabel!
    @IBOutlet var labelQueso: WKInterfaceLabel!
    @IBOutlet var labelIngrediente1: WKInterfaceLabel!
    @IBOutlet var labelIngrediente2: WKInterfaceLabel!
    @IBOutlet var labelIngrediente3: WKInterfaceLabel!
    @IBOutlet var labelIngrediente4: WKInterfaceLabel!
    @IBOutlet var labelIngrediente5: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        configuracion = context as! Pedido
        labelTamaño.setText(pizza.tamañoDePizza[configuracion.tamañoSeleccionado])
        labelMasa.setText(pizza.tipoDeMasa[configuracion.masaSeleccionada])
        labelQueso.setText(pizza.tipoDeQueso[configuracion.quesoSeleccionado])
        labelIngrediente1.setText((pizza.devuelveIngredienteSeleccionado(configuracion.ingredientes[0])))
        labelIngrediente2.setText((pizza.devuelveIngredienteSeleccionado(configuracion.ingredientes[1])))
        labelIngrediente3.setText((pizza.devuelveIngredienteSeleccionado(configuracion.ingredientes[2])))
        labelIngrediente4.setText((pizza.devuelveIngredienteSeleccionado(configuracion.ingredientes[3])))
        labelIngrediente5.setText((pizza.devuelveIngredienteSeleccionado(configuracion.ingredientes[4])))
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func Confirmar() {
        popToRootController()
    }

}

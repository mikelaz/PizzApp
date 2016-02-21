//
//  InterfaceController3.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 20/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController3: WKInterfaceController {

    
    @IBOutlet var selQueso: WKInterfacePicker!
    let pizza = Pizza()
    var configuracion = Pedido ()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        configuracion = context as! Pedido
        
        let pickerItems : [WKPickerItem] = pizza.tipoDeQueso.map {
            let pickerItem = WKPickerItem()
            //pickerItem.caption = $0.0
            pickerItem.title = $0
            return pickerItem
        }
        selQueso.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func SelecQueso(value: Int) {
        configuracion.quesoSeleccionado = value
        print(" \(configuracion.tamañoSeleccionado), \(configuracion.masaSeleccionada), \(configuracion.quesoSeleccionado)")

    }
    @IBAction func Avanzar() {
        pushControllerWithName("IntIngredientes", context: configuracion)
    }

}

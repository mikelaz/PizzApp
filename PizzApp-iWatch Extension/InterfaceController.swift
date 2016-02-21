//
//  InterfaceController.swift
//  PizzApp-iWatch Extension
//
//  Created by Mikel Aguirre on 20/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    let pizza = Pizza()
    let configuracion = Pedido()
    @IBOutlet var selTamaño: WKInterfacePicker!
    
    //var itemList: [String] = ["Red", "Green", "Blue","Yellow", "Indigo", "Violet"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let pickerItems : [WKPickerItem] = pizza.tamañoDePizza.map {
            let pickerItem = WKPickerItem()
            //pickerItem.caption = $0.0
            pickerItem.title = $0
            return pickerItem
        }
        selTamaño.setItems(pickerItems)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func SelecTamaño(value: Int) {
        configuracion.tamañoSeleccionado = value
        print("\(configuracion.tamañoSeleccionado)")
    }

    @IBAction func Avanzar() {
        pushControllerWithName("IntMasa", context: configuracion)
    }
    

}

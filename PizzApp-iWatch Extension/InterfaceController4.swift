//
//  InterfaceController4.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 20/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController4: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!
    @IBOutlet var labelIngredientes: WKInterfaceLabel!

    let pizza = Pizza()
    var configuracion = Pedido ()
    var arraySeleccion = [Int]()
    var numIngredientes = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        configuracion = context as! Pedido
        //Inicializamos el array de seleccion de ingredientes
        arraySeleccion.removeAll()
        for i in 0..<pizza.tipoDeIngredientes.count{
            arraySeleccion.insert(0, atIndex: i)            
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func loadTable() {
        
        myTable.setNumberOfRows(pizza.tipoDeIngredientes.count,
            withRowType: "MyRowController")
        
        for (index, labelText) in pizza.tipoDeIngredientes.enumerate() {
            let row = myTable.rowControllerAtIndex(index)
                as! MyRowController
            row.myLabel.setText(labelText)
        }
    }
    
    override init() {
        super.init()
        loadTable()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = table.rowControllerAtIndex(rowIndex) as! MyRowController
        if (arraySeleccion[rowIndex]==0 && numIngredientes<5) {
            row.myLabel.setTextColor(UIColor.cyanColor())
            arraySeleccion[rowIndex] = 1
            numIngredientes++
            labelIngredientes.setText(String(numIngredientes))
        }else if (arraySeleccion[rowIndex]==1){
            row.myLabel.setTextColor(UIColor.whiteColor())
            arraySeleccion[rowIndex] = 0
            numIngredientes--
            labelIngredientes.setText(String(numIngredientes))
        }
    }
    
    @IBAction func Avanzar() {
        //indiceConfiguracion: indice para recorrer los 5 ingredientes
        var indiceConfiguracion = 0
        
        //reiniciamos el array con la configuración de ingredientes para actualizarlo a a situación actual
        for i in 0..<configuracion.ingredientes.count{
            configuracion.ingredientes[i] = -1
        }
        
        //indiceSeleccion: indice para recorrer el array con los ingredientes seleccionados
        for indiceSeleccion in 0..<arraySeleccion.count{
            if arraySeleccion[indiceSeleccion]==1{
                configuracion.ingredientes[indiceConfiguracion]=indiceSeleccion
                indiceConfiguracion++
            }
        }
        pushControllerWithName("IntResumen", context: configuracion)
        
    }
    

}

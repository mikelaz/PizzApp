//
//  ViewController2.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 5/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var selTamaño: UIPickerView!
    var pizza = Pizza()
    var indiceSeleccionado : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Connect data
        self.selTamaño.delegate = self
        self.selTamaño.dataSource = self
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Número de Columnas del PickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Número de Filas de datos del PickerView
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizza.tamañoDePizza.count
    }
    
    // Los datos que se están pasando a la Fila/Columna
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizza.tamañoDePizza[row]
    }
    
    // Captura de la selección actual
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.indiceSeleccionado = row
        print(pizza.tamañoDePizza[row])
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Tenemos que declarar una instancia de tipo segue al siguiente ViewController para poder enviarle datos
        let vistaMasa = segue.destinationViewController as! ViewController3
        // Enviamos datos a variables declaradas en la siguiente Vista
        vistaMasa.tamañoSeleccionado = indiceSeleccionado
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

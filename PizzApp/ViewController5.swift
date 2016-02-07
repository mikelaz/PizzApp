//
//  ViewController5.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 7/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import UIKit

class ViewController5: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var selIngrediente: UIPickerView!
   
    //@IBOutlet weak var tamañoPizza: UILabel!
    //@IBOutlet weak var masaPizza: UILabel!
    //@IBOutlet weak var quesoPizza: UILabel!
    @IBOutlet weak var campoIngrediente1: UILabel!
    @IBOutlet weak var campoIngrediente2: UILabel!
    @IBOutlet weak var campoIngrediente3: UILabel!
    @IBOutlet weak var campoIngrediente4: UILabel!
    @IBOutlet weak var campoIngrediente5: UILabel!
    
    var pizza = Pizza()
    var indiceSeleccionado : Int = 0
    var tamañoSeleccionado : Int = 0
    var masaSeleccionada : Int = 0
    var quesoSeleccionado : Int = 0
    var ingrediente1 :Int = -1
    var ingrediente2 :Int = -1
    var ingrediente3 :Int = -1
    var ingrediente4 :Int = -1
    var ingrediente5 :Int = -1
    
    
    override func viewWillAppear(animated: Bool) {
        
        //tamañoPizza.text = pizza.tamañoDePizza[tamañoSeleccionado]
        ///masaPizza.text = pizza.tipoDeMasa[masaSeleccionada]
        //quesoPizza.text = pizza.tipoDeQueso[quesoSeleccionado]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //Connect data
        self.selIngrediente.delegate = self
        self.selIngrediente.dataSource = self

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
        return pizza.tipoDeIngredientes.count
    }
    
    // Los datos que se están pasando a la Fila/Columna
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizza.tipoDeIngredientes[row]
    }
    
    // Captura de la selección actual
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.indiceSeleccionado = row
        print(pizza.tipoDeIngredientes[row])
        
    }
    
    func lanzarAlerta() {
        let title = NSLocalizedString("Ingrediente duplicado", comment: "")
        let message = NSLocalizedString("Seleccione otro ingrediente distinto", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel){ action in NSLog("Error ingrediente duplicado.") }
        
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func añadirIngrediente(sender: UIButton) {
        //Los ingredientes no seleccionados tienen valor -1
        //Si ya hemos seleccionado antes el ingrediente, lanzamos un error y obligamos al usuario a selecionar un ingrediente distinto
        if ingrediente1 == -1 && ingrediente2 == -1 && ingrediente3 == -1 && ingrediente4 == -1 && ingrediente5 == -1{
            ingrediente1 = indiceSeleccionado
            campoIngrediente1.text = pizza.tipoDeIngredientes[indiceSeleccionado]
        }else if ingrediente2 == -1 && ingrediente3 == -1 && ingrediente4 == -1 && ingrediente5 == -1{
            if indiceSeleccionado != ingrediente1{
                ingrediente2 = indiceSeleccionado
                campoIngrediente2.text = pizza.tipoDeIngredientes[indiceSeleccionado]
            }else{
                self.lanzarAlerta()
            }
        }else if ingrediente3 == -1 && ingrediente4 == -1 && ingrediente5 == -1{
             if indiceSeleccionado != ingrediente1 && indiceSeleccionado != ingrediente2{
                ingrediente3 = indiceSeleccionado
                campoIngrediente3.text = pizza.tipoDeIngredientes[indiceSeleccionado]
             }else{
                self.lanzarAlerta()
            }
        }else if ingrediente4 == -1 && ingrediente5 == -1{
            if indiceSeleccionado != ingrediente1 && indiceSeleccionado != ingrediente2 && indiceSeleccionado != ingrediente3{
                ingrediente4 = indiceSeleccionado
                campoIngrediente4.text = pizza.tipoDeIngredientes[indiceSeleccionado]
            }else{
                self.lanzarAlerta()
            }
        }else if ingrediente5 == -1{
              if indiceSeleccionado != ingrediente1 && indiceSeleccionado != ingrediente2 && indiceSeleccionado != ingrediente3 && indiceSeleccionado != ingrediente4{
                ingrediente5 = indiceSeleccionado
                campoIngrediente5.text = pizza.tipoDeIngredientes[indiceSeleccionado]
              }else{
                self.lanzarAlerta()
            }
        }


    }
   
    @IBAction func borrarIngredientes(sender: UIButton) {
        
        //Reseteamos los valores de las variables a -1 y reseteamos el texto de los labels
        ingrediente1 = -1
        campoIngrediente1.text = "Ingrediente 1"
        ingrediente2 = -1
        campoIngrediente2.text = "Ingrediente 2"
        ingrediente3 = -1
        campoIngrediente3.text = "Ingrediente 3"
        ingrediente4 = -1
        campoIngrediente4.text = "Ingrediente 4"
        ingrediente5 = -1
        campoIngrediente5.text = "Ingrediente 5"
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vistaResumen = segue.destinationViewController as! ViewController6
        // Enviamos datos a variables declaradas en la siguiente Vista
        vistaResumen.tamañoSeleccionado = tamañoSeleccionado
        vistaResumen.masaSeleccionada = masaSeleccionada
        vistaResumen.quesoSeleccionado = quesoSeleccionado
        vistaResumen.ingrediente1 = ingrediente1
        vistaResumen.ingrediente2 = ingrediente2
        vistaResumen.ingrediente3 = ingrediente3
        vistaResumen.ingrediente4 = ingrediente4
        vistaResumen.ingrediente5 = ingrediente5
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

//
//  ViewController6.swift
//  PizzApp
//
//  Created by Mikel Aguirre on 7/2/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import UIKit

class ViewController6: UIViewController {

    @IBOutlet weak var tamañoPizza: UILabel!
    @IBOutlet weak var masaPizza: UILabel!
    @IBOutlet weak var quesoPizza: UILabel!
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
        
        tamañoPizza.text = pizza.tamañoDePizza[tamañoSeleccionado]
        masaPizza.text = pizza.tipoDeMasa[masaSeleccionada]
        quesoPizza.text = pizza.tipoDeQueso[quesoSeleccionado]
        campoIngrediente1.text = pizza.devuelveIngredienteSeleccionado(ingrediente1)
        campoIngrediente2.text = pizza.devuelveIngredienteSeleccionado(ingrediente2)
        campoIngrediente3.text = pizza.devuelveIngredienteSeleccionado(ingrediente3)
        campoIngrediente4.text = pizza.devuelveIngredienteSeleccionado(ingrediente4)
        campoIngrediente5.text = pizza.devuelveIngredienteSeleccionado(ingrediente5)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

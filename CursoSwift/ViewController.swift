//
//  ViewController.swift
//  CursoSwift
//
//  Created by Jose Muñoz on 21/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var btCambiarTexto: UIButton!
    var isTrue = false
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cambiarTexto(_ sender: Any) {
        if n >= 20 {
            etiqueta.text = "PUTAAAAAAAA"
        } else if (isTrue) {
            etiqueta.text="Eres"
            isTrue = !isTrue
        } else {
            etiqueta.text="Puta"
            isTrue = !isTrue
        }
        n += 1
    }
    
}


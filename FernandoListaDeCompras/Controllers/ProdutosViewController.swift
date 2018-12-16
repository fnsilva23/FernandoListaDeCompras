//
//  ProdutosViewController.swift
//  FernandoListaDeCompras
//
//  Created by Fernando Nascimento Silva on 30/09/2018.
//  Copyright © 2018 FNSIST Tecnologia da Informação. All rights reserved.
//

import UIKit

class ProdutosViewController: UIViewController {
    
    @IBOutlet weak var tfProduto: UITextField!
    @IBOutlet weak var ivProduto: UIImageView!
    @IBOutlet weak var tfEstado: UITextField!
    @IBOutlet weak var tfValor: UITextField!
    @IBOutlet weak var swCartao: UISwitch!
    
    var produto: Produto!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addEditProduto(_ sender: UIButton) {
        if produto == nil {
            produto = Produto(context: context)
        }
        produto.nome = tfProduto.text
        //produto.imagem
        produto.valor = Double(tfValor.text!) ?? 0
        
        do{
            try context.save()
            
        } catch {
            print(error.localizedDescription)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
   
}

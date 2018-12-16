//
//  ConfiguracaoViewController.swift
//  FernandoListaDeCompras
//
//  Created by Fernando Nascimento Silva on 15/12/2018.
//  Copyright © 2018 FNSIST Tecnologia da Informação. All rights reserved.
//

import UIKit

class ConfiguracaoViewController: UIViewController {

    
    @IBOutlet weak var tfCotacao: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    
    let ud = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        tfCotacao.text = ud.string(forKey: "cotacao")
        tfIOF.text = ud.string(forKey: "iof")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        saveCategory()
    }
    
    func saveCategory(){
        view.endEditing(true)
        ud.set(tfCotacao.text ?? "", forKey: "cotacao")
        ud.set(tfIOF.text ?? "", forKey: "iof")
        
        
        //ud.set(sender.isOn, forKey: "autoplay")
    }


}


extension ConfiguracaoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveCategory()
        return true
    }
}


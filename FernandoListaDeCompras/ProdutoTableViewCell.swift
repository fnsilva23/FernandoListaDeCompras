//
//  ProdutoTableViewCell.swift
//  FernandoListaDeCompras
//
//  Created by Fernando Nascimento Silva on 15/12/2018.
//  Copyright © 2018 FNSIST Tecnologia da Informação. All rights reserved.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {

    @IBOutlet weak var lbProduto: UILabel!
    @IBOutlet weak var lbValor: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare (with produto: Produto){
        lbProduto.text = produto.nome ?? ""
        lbValor.text = "\(produto.valor)"
        // if let image = produto.imagem as? Image{ ivProduto.image = image} else {ivProduto.image = UIImage(named: "sem imagem");
    }
    
}

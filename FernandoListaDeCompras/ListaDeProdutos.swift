//
//  ListaDeProdutos.swift
//  FernandoListaDeCompras
//
//  Created by Fernando Nascimento Silva on 15/12/2018.
//  Copyright © 2018 FNSIST Tecnologia da Informação. All rights reserved.
//

import Foundation

struct ProdutoXML:Codable{
    let nome: String
    let imagem: String
    let estado: String
    let valor: Double
    let cartao: Bool
}

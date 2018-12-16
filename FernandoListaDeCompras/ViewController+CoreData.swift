//
//  ViewController+CoreData.swift
//  FernandoListaDeCompras
//
//  Created by Fernando Nascimento Silva on 15/12/2018.
//  Copyright © 2018 FNSIST Tecnologia da Informação. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController{
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}

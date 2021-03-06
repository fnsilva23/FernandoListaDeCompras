//
//  ListaDeComprasTableViewController.swift
//  FernandoListaDeCompras
//
//  Created by Fernando Nascimento Silva on 15/12/2018.
//  Copyright © 2018 FNSIST Tecnologia da Informação. All rights reserved.
//

import UIKit
import CoreData
import AVKit

class ListaDeComprasTableViewController: UITableViewController {

    
    //Label que exibe "Sem Filmes"
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 22))
    
    
    // Conjunto de produtos
    //var produtos: [Produto] = []
    var fetchedResultController: NSFetchedResultsController<Produto>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProdutos()

        label.text = "Sem Produtos"
        label.textAlignment = .center
        label.textColor = .white
        
    }
    
    private func loadProdutos(){
        
        let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "nome", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = fetchedResultController.fetchedObjects?.count == 0 ? label: nil
        //Retorna a quantidade de itens do objeto fetchedResultController
        return fetchedResultController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produtoCell", for: indexPath) as! ProdutoTableViewCell
        
        guard let produto = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }
        cell.prepare(with: produto)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ListaDeComprasTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            case .delete:
                    break
            default:
                tableView.reloadData()
        }
    }
}

//
//  VCTabela.swift
//  trabalho1_ios
//
//  Created by Joao Viana on 5/12/17.
//  Copyright © 2017 pjota.joaoviana. All rights reserved.
//

import UIKit


class VCTabela: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnNovo: UIBarButtonItem!
    @IBAction func btnNovoAction(_ sender: Any) {
        self.performSegue(withIdentifier: "segue2", sender: sender)
    }
    
    @IBOutlet weak var data: UILabel!
    
    class Movie {
        var name: String
        var genre: String
        init(name: String,genre: String) {
            self.name = name
            self.genre = genre
        }
    }
    
    
    var m1 = Movie(name: "Matrix",genre: "Action")
    var m2 = Movie(name: "Alien", genre: "Horror")
    var m3 = Movie(name: "Star Wars", genre: "Sci-Fi")
    //var array = ["Matrix","Alien","Star Wars"]
    var arrayM = [Movie]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayM.append(m1);arrayM.append(m2);arrayM.append(m3)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        data.text = dateFormatter.string(from: date)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editar = UITableViewRowAction(style: .default, title: "Editar"){action,index in print("editar: " + String(index.row) + " " + self.arrayM[index.row].name)
            self.performSegue(withIdentifier: "segue3", sender: indexPath)
        }
        editar.backgroundColor = UIColor.blue
        
        let delete = UITableViewRowAction(style: .default, title: "Apagar"){action,index in print("apagar: " + String(index.row))
            let refreshAlert = UIAlertController(title: NSLocalizedString("VCTabela.delete", comment: ""), message: NSLocalizedString("VCTabela.data_lost", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
                self.arrayM.remove(at: index.row)
                tableView.reloadData()
                
            }))
            refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("VCTabela.cancel", comment: ""), style: .cancel, handler: { (action: UIAlertAction!) in
            }))
            self.present(refreshAlert, animated: true, completion: nil)

        }
        
        
        delete.backgroundColor = UIColor.red
        
        return [editar,delete]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = arrayM[indexPath.row].name
        cell.detailTextLabel?.text = arrayM[indexPath.row].genre
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segue3"){
            let idx = sender as! IndexPath
            let vcdetalhe = (segue.destination as! VCDetalhe)
            vcdetalhe.id_movie = idx.row
            vcdetalhe.movie_name = arrayM[idx.row].name
            vcdetalhe.movie_genre = arrayM[idx.row].genre
        }
    }
    
    
    @IBAction func unwindFromDetalheGravar(segue: UIStoryboardSegue) {
        let details = segue.source as! VCDetalhe
        let movie_name:String = details.textMovie.text!
        let movie_genre:String = details.genreChoosen2.text!
        if(details.id_movie != -1){
            self.arrayM.remove(at: details.id_movie)
        }
        arrayM.append(Movie(name: movie_name,genre: movie_genre))
        tableView.reloadData()
    }
}

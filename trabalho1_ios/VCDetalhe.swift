//
//  VCDetalhe.swift
//  trabalho1_ios
//
//  Created by Joao Viana on 5/12/17.
//  Copyright © 2017 pjota.joaoviana. All rights reserved.
//

import UIKit


class VCDetalhe: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var textMovie: UITextField!
    @IBOutlet weak var listGenres: UIPickerView!
    @IBOutlet weak var genreChoosen2: UITextField!
    
    var data = ["Horror","Action","Sci-Fi","Comedy","Romance"]
    
    var movie_name = ""
    var movie_genre = ""
    var id_movie:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textMovie.delegate = self as UITextFieldDelegate
        listGenres.delegate = self
    
        textMovie.text = movie_name
        genreChoosen2.text = movie_genre
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(textMovie.text == ""){
            print("No name for Movie")
            return false
        }
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genreChoosen2.text = data[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (genreChoosen2.text == ""){
            genreChoosen2.text = data[row]
        }
        return data[row]
    }
    
}


//
//  Biblioteca.swift
//  TempoApp
//
//  Created by jeremias serafim on 1/19/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit
import Alamofire

class Biblioteca{
    
    let url = "http://biblioteca-jeremias.appspot.com/get/1"
     let url2 = "http://biblioteca-jeremias.appspot.com/get"
    
    var fulldic : [Dictionary<String,AnyObject>]!
    
    var _livro_id: String!
    var _preco: String!
    var _titulo: String!
    var _autores: String!
    var _capa: String!
    var _descricao: String!
    
    
    
    var fulldicionario : [Dictionary<String,AnyObject>] {
        if fulldic == nil{
            
            fulldic = [Dictionary<String,AnyObject>]()
        }
        
        return fulldic
    }
    
    var livro_id: String {
        if _livro_id == nil {
            _livro_id = "-"
        }
        return _livro_id
    }
    var preco: String {
        if _preco == nil {
            _preco = "-"
        }
        return _preco
    }
    var titulo: String {
        if _titulo == nil {
            _titulo = "-"
        }
        return _titulo
    }
    var autores: String {
        if _autores == nil {
            _autores = "-"
        }
        return _autores
    }
    var capa: String {
        if _capa == nil {
            _capa = "-"
        }
        return _capa
    }
    var descricao: String {
        if _descricao == nil {
            _descricao = "-"
        }
        return _descricao
    }
    

    
    func downloadBibliotecaData2(completed: @escaping DownloadComplete){
   
        
        Alamofire.request(url2).responseJSON{ response in
            
            let result = response.result

            
            if let f_dict = result.value as? [Dictionary<String,AnyObject>]{
                
                self.fulldic = f_dict
                

                for dic in f_dict{
                    
                    if let __livro_id = dic["livro_id"] as? String{
                        self._livro_id = __livro_id

                    }
                
                }
     
            }
            completed()
        }
        
    }
    
    

    
    
    
}


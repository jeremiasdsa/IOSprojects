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
    
    var fulldic = [Dictionary<String,AnyObject>]()
    
    var _livro_id: String!
    var _preco: String!
    var _titulo: String!
    var _autores: String!
    var _capa: String!
    var _descricao: String!
    
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
    
    
    
    
    
    func downloadBibliotecaData2(completed: @escaping  DownloadComplete){
        
        Alamofire.request(url2).responseJSON{ response in
            
            let result = response.result
//            print(result)
            print("________________________________")
            
            if let f_dict = result.value as? [Dictionary<String,AnyObject>]{
                
                self.fulldic = f_dict
                
//                print(self.fulldic, "fulldict")
                for dic in f_dict{
                    
                    if let __livro_id = dic["livro_id"] as? String{
                        self._livro_id = __livro_id
//                        print(__livro_id)
//                        print("\(dic["titulo"])")
                    }
                
                }
                
                
                
                
            }
            
        }
        completed()
    }
    
    
    
    
    
    func downloadBibliotecaData(completed: @escaping  DownloadComplete){
        
        downloadBibliotecaData2 {
           // <#code#>
        }
        
        Alamofire.request(url).responseJSON{ response in

            let result = response.result
//            print(result)
            print("________________________________")
            
            if let dict = result.value as? Dictionary<String,AnyObject>{
                
                if let __livro_id = dict["livro_id"] as? String{
                    self._livro_id = __livro_id
//                    print(self.livro_id)
                }
                if let __preco = dict["preco"] as? String{
                    self._preco = __preco
//                    print(self.preco)
                }
                if let __titulo = dict["titulo"] as? String{
                    self._titulo = __titulo
//                    print(self.titulo)
                }
                if let __autores = dict["autores"] as? String{
                    self._autores = __autores
//                    print(self.autores)
                }
                if let __capa = dict["capa"] as? String{
                    self._capa = __capa
//                    print(self.capa)
                }

                if let __descricao = dict["descricao"] as? String{
                    self._descricao = __descricao
//                    print(self.descricao)
                }


            }
        
        }
    completed()
        print(self.fulldic, "fulldict")
    }
    
    
    
}


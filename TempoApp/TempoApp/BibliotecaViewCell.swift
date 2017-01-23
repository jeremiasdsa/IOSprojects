//
//  BibliotecaViewCell.swift
//  TempoApp
//
//  Created by jeremias serafim on 1/22/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit

class BibliotecaViewCell: UITableViewCell {
    
 
    @IBOutlet weak var imageViewBiblioteca: UIImageView!
    
    
    @IBOutlet weak var livro: UILabel!
    
    @IBOutlet weak var autor: UILabel!
    
    
    
    
    
    
    
    
    
    func setupCell(biblioteca: Dictionary<String,AnyObject>){
        
        let biblioteca = biblioteca
        

        if let __titulo = biblioteca["titulo"] as? String{
           
            self.livro.text = __titulo
          
            //                    print(self.titulo)
        }
        if let __autores = biblioteca["autores"] as? String{
              self.autor.text = __autores
            
            //                    print(self.autores)
        }
        if let __capa = biblioteca["capa"] as? String{
            
           
            
            let url = URL(string: __capa)
            
            
                DispatchQueue.global().async {
                    
                    let data2 = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        
                        self.imageViewBiblioteca.image = UIImage(data: data2!)
                    }
                    
                }
            
        }

        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}

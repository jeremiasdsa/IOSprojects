//
//  BibliotecaViewCell.swift
//  TempoApp
//
//  Created by jeremias serafim on 1/22/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit

class BibliotecaViewCell: UITableViewCell {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var livro: UILabel!
    
    @IBOutlet weak var autor: UILabel!
    
    
    
    func setupCell(livro: Biblioteca){
        self.livro.text = livro.titulo
        self.autor.text = livro.autores
        
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

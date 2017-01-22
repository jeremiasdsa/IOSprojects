//
//  ViewControllerBiblioteca.swift
//  TempoApp
//
//  Created by jeremias araujo on 20/01/17.
//  Copyright © 2017 jeremias araujo. All rights reserved.
//

import UIKit

class ViewControllerBiblioteca: UIViewController , UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableview: UITableView!
    
    var biblioteca : Biblioteca!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        biblioteca = Biblioteca()
        
        biblioteca.downloadBibliotecaData2 {
            print("ViewControlerBiblioteca -- doing download")
            print(self.biblioteca.fulldicionario)
        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedButton(_ sender: Any) {
        print("Clicadamente clicado")
    }

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bibliotecaCell", for: indexPath)
        
        return cell
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

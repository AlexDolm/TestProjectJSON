//
//  TableViewController.swift
//  TestProjectJSON
//
//  Created by mac on 02.06.2022.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    var runMocky: RunMocky? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        JSONLoad()
        
    }
    
    
    

    func JSONLoad(){
        guard let URlRunMocky = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else
        {
            return
        }
        URLSession.shared.dataTask(with: URlRunMocky) { data, response, error in
            guard let data = data else {return}
            do {
                self.runMocky = try JSONDecoder().decode(RunMocky.self, from: data)
//                var g = runMocky.company.employees.sorted { $0.name < $1.name }
                
                DispatchQueue.main.async {
                    self.TableFront()
                    self.indicator.stopAnimating()
                }
            } catch  {
                DispatchQueue.main.async {
                    self.alertError(title: "Ошибка", message: "Сервер временно недоступен. Проверьте подключение к сети.")
                    self.indicator.stopAnimating()
                }
            }
        }.resume()
    }
    
    func TableFront(){
        title = runMocky?.company.name
 
    }
    
    
    
    

}

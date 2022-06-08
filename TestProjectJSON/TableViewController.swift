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
    var dataLoad = DataLoad()
    var cashRunMocky = NSCache<NSString, RunMocky>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        
        let URlRunMocky = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4cu")!

        dataLoad.JSONLoad2(URlRunMocky:URlRunMocky){ result in
            self.runMocky = result
            
            if self.runMocky != nil{
                DispatchQueue.main.async { [self] in
                    title = self.runMocky?.company.name
                    indicator.stopAnimating()
                }
            
            }
            else{
                
                DispatchQueue.main.async {
                    self.alertError(title: "Ошибка", message: "Сервер временно недоступен. Проверьте подключение к сети.")
                                    self.indicator.stopAnimating()
                }
            }
        }

        

    }
    

    
    
    
    

}

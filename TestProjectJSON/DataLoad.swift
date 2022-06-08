//
//  DataLoad.swift
//  TestProjectJSON
//
//  Created by mac on 08.06.2022.
//
import UIKit
class DataLoad{
    var cashRunMocky = NSCache<NSString, RunMocky>()
    
    
    func JSONLoad2(URlRunMocky: URL, completion: @escaping (RunMocky?) -> Void)
    {
        if let runMocky = cashRunMocky.object(forKey: URlRunMocky.absoluteString as NSString) {
            completion(runMocky)
        }
        else{
        var runMocky: RunMocky?
        
        URLSession.shared.dataTask(with: URlRunMocky) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                runMocky = try JSONDecoder().decode(RunMocky.self, from: data)
                self.cashRunMocky.setObject(runMocky!, forKey: URlRunMocky.absoluteString as NSString)
                
            } catch  {
                runMocky = nil

            }
            completion(runMocky)
            }.resume()
            
        }
            
    }
    
}
    



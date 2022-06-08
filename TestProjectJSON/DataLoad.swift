//
//  DataLoad.swift
//  TestProjectJSON
//
//  Created by mac on 08.06.2022.
//
import UIKit
class DataLoad{
    
    func JSONLoad2(URlRunMocky: URL, completion: @escaping (RunMocky?) -> Void)
    {
        var runMocky: RunMocky?
        
        URLSession.shared.dataTask(with: URlRunMocky) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                runMocky = try JSONDecoder().decode(RunMocky.self, from: data)
            } catch  {
                runMocky = nil

            }
            completion(runMocky)
        }.resume()
        
            
    }
    
}
    



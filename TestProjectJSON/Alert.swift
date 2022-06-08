//
//  Alert.swift
//  TestProjectJSON
//
//  Created by mac on 02.06.2022.
//

import Foundation
import UIKit

extension TableViewController {
    
    func alertError(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "ОК", style: .default)
        
        alertController.addAction(alertOk)
        present(alertController, animated: true, completion: nil)
        
    }

    
}

//
//  RunMockyModel.swift
//  TestProjectJSON
//
//  Created by mac on 02.06.2022.
//

import Foundation

class RunMocky: Decodable{
    var company: Company
    
    init(company: Company) {
        self.company = company
    }
}

struct Company: Decodable{
    var name: String
    var employees: [Employees]
}

struct Employees: Decodable{
    var name: String
    var phone_number: String
    var skills: [String]
}

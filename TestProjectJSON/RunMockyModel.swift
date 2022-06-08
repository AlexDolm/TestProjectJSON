//
//  RunMockyModel.swift
//  TestProjectJSON
//
//  Created by mac on 02.06.2022.
//

import Foundation

struct RunMocky: Decodable{
    var company: Company
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

//
//  LawyerViewModel.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import Foundation

 

class LawyerModelView
{
    var index:Int = 0
    var lawyers:[[String]] = []
    func fetch(){
        lawyers = parseLawyers()
        //            lawyers.remove(at: 0)
        
    }
    
    func toDetailsViewController()
    {
        
    }
    
}

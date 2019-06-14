//
//  PreseToInterPlacesProtocol.swift
//  test tabela
//
//  Created by Sergio Gelves on 6/14/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import RxSwift

protocol PreseToInterPlacesProtocol: AnyObject {
    
    var userRequestedPlacesPage: PublishSubject<Bool> { get }
    var userResetInitialData: PublishSubject<Dictionary<String, Any>> { get }
    
}

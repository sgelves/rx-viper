//
//  PreseToViewPlacesProtocol.swift
//  test tabela
//
//  Created by Sergio Gelves on 6/14/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import RxSwift

protocol PreseToViewPlacesProtocol: class {
    
    var placesDataChanged: PublishSubject<[Local]> { get }
    
}

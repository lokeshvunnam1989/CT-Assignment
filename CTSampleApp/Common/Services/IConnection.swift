//
//  IConnection.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

public typealias RequestCallback = ((Data?, Error?) -> Void)

public class IConnection {
    func sendRequest(_ request: IRequest, callback: @escaping RequestCallback) {
        fatalError("Must Override in class: \(self)")
    }
}

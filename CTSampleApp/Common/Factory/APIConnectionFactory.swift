//
//  APIConnectionFactory.swift
//  CTSampleApp
//
//  Created by Lokesh on 12/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class APIConnectionFactory {
    
    public class func connection() -> IConnection {
        return serverConnecion()
    }
    
    private class func serverConnecion() -> IConnection {

        return  HTTPClient(baseURL: LiveURL!)
    }
}

//
//  CabifyApiManager.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import Foundation
import Alamofire

class CabifyApiManager: NSObject {
    static let shared = CabifyApiManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        
        let networkLogger = CabifyNetworkLogger()
        let interceptor = CabifyRequestInterceptor()
        
        return Session(configuration: configuration,
                       interceptor: interceptor,
                       cachedResponseHandler: responseCacher,
                       eventMonitors: [networkLogger])
    }()
}

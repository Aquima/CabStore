//
//  CabifyNetworkLogger.swift
//  CabStore
//
//  Created by Raul on 1/03/23.
//

import Foundation
import Alamofire
import UIKit
class CabifyNetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "com.bcp.app.networklogger")
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>){
        guard let data = response.data else {
            return
        }
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}

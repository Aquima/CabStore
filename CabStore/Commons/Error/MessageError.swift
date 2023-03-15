//
//  MessageError.swift
//  BCPChallenge
//
//  Created by Raul on 29/11/21.
//

import Foundation
import UIKit
enum ServerError: Int {
    case unacceptable = 401
    case nointernet = 0
  // Throw in all other cases
    case unexpected = -1
}
struct MessageError {
    let title: String
    let message: String
    init(serverError: ServerError) {
        switch serverError {
        case .unacceptable:
            title = "Credenciles"
            message = "Las credenciales son incorrectas intentelo mas tarde."
        case .nointernet:
            title = "Internet"
            message = "El dispoasitivo no cuenta con conexion."
        default:
            title = "Ha ocurrido un error."
            message = "Intentelo mas tarde"
        }
    }
}

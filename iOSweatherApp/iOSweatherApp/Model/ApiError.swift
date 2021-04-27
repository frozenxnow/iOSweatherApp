//
//  ApiError.swift
//  iOSweatherApp
//
//  Created by 지원 on 2021/04/27.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}

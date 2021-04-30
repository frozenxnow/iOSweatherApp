//
//  Double+Formatter.swift
//  iOSweatherApp
//
//  Created by 지원 on 2021/04/30.
//

import Foundation


fileprivate let temperatureFormatter: MeasurementFormatter = {
    let f = MeasurementFormatter()
    f.locale = Locale(identifier: "ko_kr") // 생략할 경우 디바이스에서 설정되어 있는 locale 적용
    f.numberFormatter.maximumFractionDigits = 1  // 소수점 아래 한 자리까지 출력
    f.unitOptions = .temperatureWithoutUnit // 숫자만 출력. 다른 문자는 출력되지 않도록 옵션
    return f
} ()

extension Double {
    var temperatureString: String {
        let temp = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return temperatureFormatter.string(from: temp)
    }
}


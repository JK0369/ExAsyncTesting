//
//  RxOperators.swift
//  ExAsyncRx
//
//  Created by 김종권 on 2022/12/21.
//

import RxSwift

extension ObservableType {
    func map<T>(_ element: T) -> Observable<T> {
        map { _ in element }
    }
}

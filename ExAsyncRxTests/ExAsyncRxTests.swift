//
//  ExAsyncRxTests.swift
//  ExAsyncRxTests
//
//  Created by 김종권 on 2022/12/21.
//

@testable import ExAsyncRx
import XCTest
import RxSwift

final class ExAsyncRxTests: XCTestCase {
    var disposeBag: DisposeBag!
    var sut: ViewReactor!
    
    override func setUp() {
        disposeBag = DisposeBag()
        sut = ViewReactor()
    }
    
    func test_WhenTapPlusButton_ThenPlusCount() {
        // Given
        let reactor = sut!
        let expectation = XCTestExpectation(description: "test_WhenTapPlusButton_ThenPlusCount")
        
        // When - tap plus button
        reactor.action.onNext(.tapPlusButton)
        
        // Then - cnt is one
        reactor.state.map(\.cnt)
            .subscribe { item in
                guard item == 1 else { return }
                expectation.fulfill()
            }
            .disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: 3)
    }
}


//
//  FavoriteHanderUseCaseTest.swift
//  ModelTests
//
//  Created by iori tenma on 2019/04/30.
//  Copyright © 2019 eifandevs. All rights reserved.
//

import Foundation
import XCTest
import RxSwift
import RxCocoa

@testable import Model
@testable import Entity

class FavoriteHanderUseCaseTest: XCTestCase {
    let dummyUrl = "https://abc/"
    let dummyUrl2 = "https://def/"
    let dummyTitle = "dummyTitle"
    let dummyTitle2 = "dummyTitle2"

    var favoriteHanderUseCase: FavoriteHanderUseCase {
        return FavoriteHanderUseCase.s
    }

    let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DeleteFavoriteUseCase().exe()
    }

    func testLoad() {
        weak var expectation = self.expectation(description: #function)

        favoriteHanderUseCase.rx_action
            .subscribe { object in
                if let action = object.element, case .load = action {
                    if let expectation = expectation {
                        expectation.fulfill()
                    }
                }
            }
            .disposed(by: disposeBag)

        favoriteHanderUseCase.load(url: dummyUrl)

        self.waitForExpectations(timeout: 10, handler: nil)
    }
}

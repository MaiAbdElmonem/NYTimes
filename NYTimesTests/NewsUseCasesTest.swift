//
//  NewsUseCasesTest.swift
//  NYTimesTests
//
//  Created by BinaryBoy on 12/20/20.
//

import XCTest
import RxTest
import RxSwift
@testable import NYTimes

class NewsUseCasesTest: XCTestCase {
    var disposeBag: DisposeBag?
    var getNewsUseCase: GetNewsUseCase?

    override func setUp() {
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        disposeBag = nil
        getNewsUseCase = nil
    }

    func testNews() {
        loadGetNewsUseCase()
        let title = "Trump Allies Eye Long-Shot Election Reversal in Congress, Testing Pence"
        let abstract = "Some House Republicans plan to try to use Congress’s tallying of electoral results on Jan. 6 to tip the election to President Trump. The attempt will put Republicans in a pinch."
        let id = 100000007497420
        let publishedDate = "2020-12-13"

        getNewsUseCase?.invoke().subscribe(onSuccess: { news in
            if let singleNews = news.first {
                XCTAssertEqual(singleNews.title, title)
                XCTAssertEqual(singleNews.abstractField, abstract)
                XCTAssertEqual(singleNews.id, id)
                XCTAssertEqual(singleNews.publishedDate, publishedDate)
            }
        }, onError: { (error) in
            XCTFail("Error in news: \(error)")
        }).disposed(by: disposeBag!)
    }

    private func loadGetNewsUseCase() {
        let repository = NewsRepositoryMockup()
        getNewsUseCase = GetNewsUseCase(repository)
    }
}

////
//  SafeBodaDataTests
//
//	NewsRepositoryTest.swift written using Swift 5.0
//
//  Created on: 01/10/2019
//
//  Copyright © 2019 SafeBoda. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
@testable import NYTimes

class NewsRepositoryTest: XCTestCase {
    var disposeBag: DisposeBag?
    var newsRepository: NewsRepository?

    override func setUp() {
        disposeBag = DisposeBag()
        let newsRemoteDataSource = NewsRemoteDataSourceMockup()
        newsRepository = NewsRepository(newsRemoteDataSource)
    }

    override func tearDown() {
        disposeBag = nil
        newsRepository = nil
    }

    func testNews() {
        let title = "Trump Allies Eye Long-Shot Election Reversal in Congress, Testing Pence"
        let abstract = "Some House Republicans plan to try to use Congress’s tallying of electoral results on Jan. 6 to tip the election to President Trump. The attempt will put Republicans in a pinch."
        let id = 100000007497420
        let publishedDate = "2020-12-13"

        newsRepository?.getNews().subscribe(onSuccess: { news in
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
}

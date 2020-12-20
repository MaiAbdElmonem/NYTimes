//
//  NewsViewModel.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import RxSwift
import RxCocoa

class NewsViewModel: BaseViewModel {
    private let getNewsUseCase: GetNewsUseCase
    private let newsBehaviorRelay = BehaviorRelay<[Any]>(value: [])
    private let emptyScreenPublishRelay = PublishRelay<Bool>()
    private var news: [News] = []

    var coordinator: NewsCoordinator?
    var dataSource: Observable<[Any]> {
        return newsBehaviorRelay.asObservable()
    }

    init(_ getNewsUseCase: GetNewsUseCase) {
        self.getNewsUseCase = getNewsUseCase
    }

    func fetch() {
        newsBehaviorRelay.accept(Array.init(repeating: true, count: 3))
        getNewsUseCase.invoke().subscribe(onSuccess: { [weak self] news in
            guard let self = self else { return }
            self.news = news
            let uiModels = news.map({ item -> NewsTableViewCell.UIModel in
                NewsTableViewCell.UIModel(title: item.title ,
                                                   subtitle: item.abstractField,
                                                   date: item.publishedDate,
                                                   imageUrl: item.media.first?.mediaMetadata.first?.url ?? "")
            })
            self.newsBehaviorRelay.accept(uiModels)
        }) { [weak self] error in
            guard let self = self else { return }
            self.handleError(error, self.fetch)
        }.disposed(by: disposeBag)
    }

    func goToDetail(_ index: Int) {
        //guard index < news.count else { return }
        //let item = news[index]
        //coordinator?.goToDetail(communication)
    }
}

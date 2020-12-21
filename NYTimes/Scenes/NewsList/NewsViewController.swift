//
//  NewsViewController.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit

class NewsViewController: BaseViewController {
    private let viewModel: NewsViewModel
    let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 97
        tableView.rowHeight = 97
        tableView.sectionHeaderHeight = 60
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsShimmerTableViewCell.self, forCellReuseIdentifier: NewsShimmerTableViewCell.identifier)
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }()

    init(_ viewModel: NewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureView()
        configureObservables()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.fetch()
    }

    // MARK: Private methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(newsTableView)
        newsTableView.addSubview(refreshControl)
        NSLayoutConstraint.activate([
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func configureNavigationBar() {
        configureNavigationBar(Strings.newsTitle.localized())
        configureBackButton()
    }

    private func configureView() {
        configureTableView()
    }

    private func configureTableView() {

        newsTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.dataSource.bind(to: newsTableView.rx.items) { [weak self] (_, row, model) in
            guard let self = self else { return UITableViewCell() }
            let indexPath = IndexPath(row: row, section: 0)
            return self.configureTableViewCell(index: indexPath, model: model)
        }.disposed(by: disposeBag)
        newsTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.newsTableView.deselectRow(at: indexPath, animated: false)
//                if let cell = self.newsTableView.cellForRow(at: indexPath) as? NewsTableViewCell {
//                    cell.markAsRead()
//                }
                self.viewModel.goToDetail(indexPath.row)
            }).disposed(by: disposeBag)

        refreshControl
            .rx.controlEvent(UIControl.Event.valueChanged)
                .subscribe(onNext: { [weak self] in
                    guard let self = self else { return }
                    self.viewModel.fetch()
                    self.refreshControl.endRefreshing()
                    }, onCompleted: nil, onDisposed: nil)
                .disposed(by: disposeBag)
    }

    private func configureObservables() {
        viewModel.errorRelay.bind { [weak self] error in
            guard let self = self else { return }
            self.emptyState(emptyPlaceHolderType: .error(message: error.localizedDescription))
        }.disposed(by: disposeBag)
    }

    private func configureTableViewCell(index: IndexPath, model: Any) -> UITableViewCell {
        if let newModel = model as? NewsTableViewCell.UIModel {
            if let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: index) as? NewsTableViewCell {
                cell.configureView(newModel)
                return cell
            }
        } else {
            if let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsShimmerTableViewCell.identifier, for: index) as? NewsShimmerTableViewCell {
                cell.isUserInteractionEnabled = false
                cell.configureCell()
                return cell
            }
        }
        return UITableViewCell()
    }


    func emptyState(emptyPlaceHolderType: EmptyPlaceHolderType) {
        newsTableView.setEmptyView(emptyPlaceHolderType: emptyPlaceHolderType)
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}

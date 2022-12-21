//
//  ViewController.swift
//  ExAsyncRx
//
//  Created by 김종권 on 2022/12/21.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, ReactorKit.View {
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("plus", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [plusButton, label]
            .forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: plusButton.rightAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
        ])
    }
    
    func bind(reactor: ViewReactor) {
        // Action
        plusButton.rx.tap
            .map(Reactor.Action.tapPlusButton)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // State
        reactor.state.map(\.cnt)
            .observe(on: MainScheduler.asyncInstance)
            .map(String.init)
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
}

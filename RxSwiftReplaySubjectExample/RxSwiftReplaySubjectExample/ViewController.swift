//
//  ViewController.swift
//  RxSwiftReplaySubjectExample
//
//  Created by Gabriel Cuesta Arza on 6/4/17.
//  Copyright © 2017 Gabriel Cuesta Arza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let subject = ReplaySubject<Int>.create(bufferSize: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        subject.onNext(1)
        subject.onNext(2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doSubscription(_ sender: Any) {
        subject.onNext(3)
        subject.onNext(4)
        subject.onNext(5)
        subject.onNext(6)
        
        subject.subscribe(onNext: { value in
            print(value)
        }).addDisposableTo(disposeBag)
        
        subject.onNext(7)
        
    }

}


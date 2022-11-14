//
//  ViewController.swift
//  MVVMExample
//
//  Created by Nurken Yerzhan on 14.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!
    
    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        
        createView()
        updateView()
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
    @IBAction func startAction(_ sender: Any) {
        viewModel.startFetch()
    }
    
    @IBAction func errorAction(_ sender: Any) {
        viewModel.error()
    }
    
}


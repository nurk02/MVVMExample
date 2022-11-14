//
//  ViewModel.swift
//  MVVMExample
//
//  Created by Nurken Yerzhan on 14.11.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        updateViewData?(.success(ViewData.Data(
            icon: "success",
            title: "success title",
            description: "description text",
            numberPhone: "911")))
    }
    
    public func error() {
        updateViewData?(.failure(ViewData.Data(
            icon: "failure",
            title: "error title",
            description: "not found",
            numberPhone: nil)))
    }
    
    //    public func startFetch() {
    //        //start loading. process of loading stuff like "wait its loading" loader etc.
    //        updateViewData?(.loading(ViewData.Data(icon: nil,
    //                                              title: nil,
    //                                              description: nil,
    //                                              numberPhone: nil)))
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
    //            self?.updateViewData?(.success(ViewData.Data(icon: "success", title: "success title", description: "description text", numberPhone: "911")))
    //        }
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
    //            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
    //                                                         title: "error title",
    //                                                         description: "not found",
    //                                                         numberPhone: nil)))
    //        }
    //    }
}

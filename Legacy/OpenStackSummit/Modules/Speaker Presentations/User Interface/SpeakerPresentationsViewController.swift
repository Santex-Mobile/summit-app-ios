//
//  SpeakerPresentationsViewController.swift
//  OpenStackSummit
//
//  Created by Claudio on 10/20/15.
//  Copyright © 2015 OpenStack. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SwiftSpinner

protocol SpeakerPresentationsViewControllerProtocol: ScheduleViewControllerProtocol {
    var presenter: SpeakerPresentationsPresenter! { get set }
}

class SpeakerPresentationsViewController: ScheduleViewController, IndicatorInfoProvider, SpeakerPresentationsViewControllerProtocol {
    var presenter: SpeakerPresentationsPresenter! {
        get {
            return internalPresenter as! SpeakerPresentationsPresenter
        }
        set {
            internalPresenter = newValue
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        presenter.viewLoad()
    }
    
    override func showActivityIndicator() {
        SwiftSpinner.showWithDelay(0.5, title: "Please wait...")
    }
    
    override func hideActivityIndicator() {
        SwiftSpinner.hide()
    }
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Sessions")
    }
}
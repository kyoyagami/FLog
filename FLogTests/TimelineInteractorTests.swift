//
//  FLogTests.swift
//  FLogTests
//
//  Created by Yejun Park on 13/3/20.
//  Copyright © 2020 Yejun Park. All rights reserved.
//

@testable import FLog
import Quick
import Nimble

class TimelineInteractorTests: QuickSpec {
    let userDefaultsSuiteName = "TestDefaults"
    var userDefaultsValues: Dictionary<String, Any>?
    
    var sut: TimelineInteractor!
    var timelinePresenterMock: TimelinePresenterMock!
    
    var oldRoutineArray:Array<MainRoutineModel>?
    
    override func spec() {
        beforeSuite {
            self.userDefaultsValues = UserDefaults.standard.persistentDomain(forName: Bundle.main.bundleIdentifier!)
            UserDefaults.standard.setPersistentDomain(Dictionary(), forName: Bundle.main.bundleIdentifier!)
            
            self.timelinePresenterMock = TimelinePresenterMock()
            self.sut = TimelineInteractor()
            self.sut.presenter = self.timelinePresenterMock
        }
        
        
        afterSuite {
            UserDefaults.standard.setPersistentDomain(self.userDefaultsValues!, forName: Bundle.main.bundleIdentifier!)
            
            self.timelinePresenterMock = nil
            self.sut = nil
        }
    }
}

class TimelinePresenterMock: TimelineInteractorOutputProtocol {
    var dispatched = false
    
    func didDispatchTimelines(with timelineArray: [TimelineModel]) {
        dispatched = true
    }
}
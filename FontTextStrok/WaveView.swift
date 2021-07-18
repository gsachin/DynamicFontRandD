//
//  WaveView.swift
//  FontTextStrok
//
//  Created by Sachin Gupta on 7/12/21.
//

import SwiftUI
import BAFluidView
import CoreMotion
struct WaveView: UIViewRepresentable {
    var motionManager = CMMotionManager()
    func makeUIView(context: Context) -> some UIView {
        
        
        if self.motionManager.isDeviceMotionAvailable {
            self.motionManager.deviceMotionUpdateInterval = 0.3
//            self.motionManager.startDeviceMotionUpdates(to: <#T##OperationQueue#>) { <#CMDeviceMotion?#>, <#Error?#> in
//                <#code#>
//            }
            
            self.motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { data,error in
                let nc:NotificationCenter! = NotificationCenter.default
                let userInfo:NSDictionary! = NSDictionary(object: data ?? Data(), forKey:"data" as NSCopying)
                let notificationName = NSNotification.Name(rawValue: kBAFluidViewCMMotionUpdate)
                nc.post(name: notificationName, object:self, userInfo:userInfo as? [AnyHashable : Any])
            }
            
        }
//            self.motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue,
//                                                               withHandler:{ (data:CMDeviceMotion!,error:NSError!) in
//                                                                let nc:NSNotificationCenter! = NSNotificationCenter.defaultCenter()
//                                                                let userInfo:NSDictionary! = NSDictionary.dictionaryWithObject(data, forKey:"data")
//                                                                nc.postNotificationName(kBAFluidViewCMMotionUpdate, object:self, userInfo:userInfo)
//                                                               })
//        }
        
        let fluidView = BAFluidView(frame:.zero, startElevation:0.5)
        fluidView.strokeColor = UIColor.white
        fluidView.fillColor = UIColor.red
        fluidView.keepStationary()
        fluidView.startAnimation()
        fluidView.startTiltAnimation()
        //self.changeTitleColor(UIColor.whiteColor())
        
        //                        let tiltLabel:UILabel! = UILabel()
        //        //tiltLabel.font = UIFont(name: "LoveloBlack", size:36)
        //                        tiltLabel.text = "Tilt Phone!"
        //                        tiltLabel.textColor = UIColor.whiteColor()
        //  fluidView.addSubview(tiltLabel)
        
        //tiltLabel.translatesAutoresizingMaskIntoConstraints = false
        //                        fluidView.addConstraint(NSLayoutConstraint.constraintWithItem(tiltLabel, attribute:c, relatedBy:NSLayoutRelationEqual, toItem:fluidView, attribute:NSLayoutAttributeCenterX, multiplier:1.0, constant:0))
        //                        fluidView.addConstraint(NSLayoutConstraint.constraintWithItem(tiltLabel, attribute:NSLayoutAttributeTop, relatedBy:NSLayoutRelationEqual, toItem:fluidView, attribute:NSLayoutAttributeTop, multiplier:1.0, constant:80))
        return fluidView
        
        
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}

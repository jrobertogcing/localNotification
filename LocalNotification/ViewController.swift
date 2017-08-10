//
//  ViewController.swift
//  LocalNotification
//
//  Created by Robert on 29/07/17.
//  Copyright © 2017 Robert González. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    var test = "test"
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    
    @IBOutlet weak var textPrueba: UITextField!
    
    
    @IBOutlet weak var textDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        
       
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //UIApplication.shared.applicationIconBadgeNumber = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notificationButton(_ sender: UIButton) {
    
        callNotification()
        print("ready")
    }
    
    
    
    
    
    func callNotification() {
    
        
        
       // let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: triggerDate)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = formatter.date(from: textDate.text!)
        
        let content = UNMutableNotificationContent()
        content.title = "Appointment"
        content.subtitle = (date?.description)!
        content.body = "Remeber your appointment"
        content.badge = 1
        
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date!)
        
        
        let triggerDate = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
       // let triggerDate = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: triggerDate)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
    
    
    
    
    }
    
    
    // test keyboard
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
    
        self.view.endEditing(true)

    }
    
    
    
    
}


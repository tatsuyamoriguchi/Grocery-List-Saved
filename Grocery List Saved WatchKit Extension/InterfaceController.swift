//
//  InterfaceController.swift
//  Grocery List Saved WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/10/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var itemLabel: WKInterfaceLabel!
    
    let userDefualts = UserDefaults()
    
    
    @IBAction func addItem() {
        self.presentTextInputController(withSuggestions: nil, allowedInputMode: .allowEmoji, completion: { result in
            guard let result = result else { return }
            
            OperationQueue.main.addOperation {
                self.dismissTextInputController()
                self.itemLabel.setText(result[0] as? String)
                self.userDefualts.setValue(result[0], forKey: "item")
            }
            
        })
        
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.itemLabel.setText(userDefualts.value(forKey: "item") as? String)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

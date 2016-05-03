//
//  ViewController.swift
//  DashedSlider
//
//  Created by ayalcinkaya on 02/19/2016.
//  Copyright (c) 2016 ayalcinkaya. All rights reserved.
//

import UIKit
import DashedSlider

class ViewController: UIViewController {

    @IBOutlet weak var dashedSlider: DashedSlider!
    @IBOutlet weak var dashedSlider2: DashedSlider!
    @IBOutlet weak var dashedSlider3: DashedSlider!
    @IBOutlet weak var dashedSlider4: DashedSlider!
    @IBOutlet weak var dashedSlider5: DashedSlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashedSlider.selectedBarColor = UIColor.flatBelizeHoleColor()
        dashedSlider.unselectedBarColor = UIColor.flatCloudsColor()
        dashedSlider.markWidth = 3.0
        dashedSlider.handlerColor = UIColor.flatMidnightBlueColor()
        dashedSlider.handlerWidth = 8.0
        
        dashedSlider2.selectedBarColor = UIColor.flatWetAsphaltColor()
        dashedSlider2.unselectedBarColor = UIColor.flatGreenSeaColor()
        dashedSlider2.markWidth = 6.0
        dashedSlider2.topMargin = 4.0
        dashedSlider2.handlerColor = UIColor.flatPomergranateColor()
        dashedSlider2.handlerWidth = 16.0

        dashedSlider3.selectedBarColor = UIColor.flatPomergranateColor()
        dashedSlider3.unselectedBarColor = UIColor.flatAsbestosColor()
        dashedSlider3.markWidth = 1.0
        dashedSlider3.topMargin = 0.0
        dashedSlider3.handlerColor = UIColor.flatSunflowerColor()
        dashedSlider3.handlerWidth = 12.0
        
        dashedSlider4.selectedBarColor = UIColor.flatTurquoiseColor()
        dashedSlider4.unselectedBarColor = UIColor.flatNephritisColor()
        dashedSlider4.markerCount = 20
        dashedSlider4.topMargin = 4.0
        dashedSlider4.handlerColor = UIColor.flatPumpkinColor()
        dashedSlider4.handlerWidth = 12.0
        
        dashedSlider5.selectedBarColor = UIColor.flatSunflowerColor()
        dashedSlider5.unselectedBarColor = UIColor.flatPumpkinColor()
        dashedSlider5.markerCount = 50
        dashedSlider5.topMargin = 6.0
        dashedSlider5.handlerColor = UIColor.flatWetAsphaltColor()
        dashedSlider5.handlerWidth = 8.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
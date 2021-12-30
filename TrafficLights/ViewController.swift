//
//  ViewController.swift
//  TrafficLights
//
//  Created by Leysan Latypova on 28.12.2021.
//

import UIKit

enum TrafficLightState {
    case off
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet private var redLightView: UIView!
    @IBOutlet private var yellowLightView: UIView!
    @IBOutlet private var greenLightView: UIView!
    @IBOutlet private var startButton: UIButton!
    
    private var currentState = TrafficLightState.off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeViewsRound()
        showCurrentState()
    }
    
    @IBAction private func startButtonPressed() {
        switchCurrentStateToNextState()
        showCurrentState()
    }
    
    private func makeViewsRound() {
        redLightView.layer.cornerRadius = 64
        yellowLightView.layer.cornerRadius = 64
        greenLightView.layer.cornerRadius = 64
    }
    
    private func showCurrentState() {
        
        if currentState == .off {
            redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
            startButton.setTitle("START", for: .normal)
        }
        
        if currentState == .red {
            redLightView.alpha = 1
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 0.3
            startButton.setTitle("NEXT", for: .normal)
            
        }
        
        if currentState == .yellow {
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            greenLightView.alpha = 0.3
            startButton.setTitle("NEXT", for: .normal)
        }
        
        if currentState == .green {
            redLightView.alpha = 0.3
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            startButton.setTitle("NEXT", for: .normal)
        }
        
    }

    private func switchCurrentStateToNextState() {
        
        if currentState == .off {
            currentState = .red
        }
        
        else if currentState == .red {
            currentState = .yellow
        }
        
        else if currentState == .yellow {
            currentState = .green
        }
        
        else if currentState == .green {
            currentState = .red
        }
    }
}

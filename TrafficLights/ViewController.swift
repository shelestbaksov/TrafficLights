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
        
        turnAllLightsOff()
        turnOnLight(for: currentState)
        updateButtonTitle(for: currentState)
    }
    
    private func turnAllLightsOff() {
        [redLightView, yellowLightView, greenLightView].forEach {
            $0?.turnLights(on: false)
        }
    }
    
    private func turnOnLight(for state: TrafficLightState) {
        switch state {
        case .red: redLightView.turnLights(on: true)
        case .yellow: yellowLightView.turnLights(on: true)
        case .green: greenLightView.turnLights(on: true)
        case .off: break
        }
    }
    
    private func updateButtonTitle(for state: TrafficLightState) {
        startButton.setTitle(
            state == .off ? "START" : "NEXT", for: .normal
        )
    }

    private func switchCurrentStateToNextState() {
        currentState = currentState.next
    }
}

extension TrafficLightState {
    
    var next: TrafficLightState {
        switch self {
        case .off: return .red
        case .red: return .yellow
        case .yellow: return .green
        case .green: return .red
        }
    }
}

extension UIView {
    
    func turnLights(on: Bool) {
        alpha = on ? 1 : 0.3
    }
}

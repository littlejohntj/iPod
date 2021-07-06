//
//  Rotation.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/4/21.
//

import Foundation
import SwiftUI

struct Rotation {

    enum Direction {
        case clockwise, anticlockwise
    }

    static var none = Rotation()

    private var value: Angle!
    private var time: Date!
    private var shift: Double = 0

    private init(value: Angle? = nil, time: Date? = nil) {
        self.value = value
        self.time = time
    }

    var velocity: Double = 0
    var hasChangedDirection = false

    var direction: Direction = .clockwise { didSet { hasChangedDirection = direction != oldValue } }

    var laps: Double { shift / 360 }

    func addNewEntry(angle: Angle, time: Date) -> Rotation {
        guard let value = value else { return Rotation(value: angle, time: time) }

        let increment = abs(angle.degrees - value.degrees) > 180 ? angle.degrees > value.degrees ? angle.degrees - (360 + value.degrees) : 360 + angle.degrees - value.degrees : angle.degrees - value.degrees

        var newRotation = Rotation(value: angle, time: time)
        let newVelocity = increment / time.timeIntervalSince(self.time) / 1_000

        newRotation.shift = shift + increment
        newRotation.velocity = newVelocity == 0 ? velocity : newVelocity
        newRotation.direction = increment > 0 ? .clockwise : .anticlockwise
        return newRotation
    }

}

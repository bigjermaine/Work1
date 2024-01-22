//
//  ElevationsUI.swift
//  PhoenixUIKit
//
//  Created by Bharat Kumar on 5/19/23.
//  Copyright © 2023 Dexcom, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum ElevationsUI {
    case elevation0
    case elevation1
    case elevation2
    case elevation3
    case elevation4
    case elevation5
    case elevation6
}

public extension View {
    /// This method is going to be used to set the drop shadows in the views according to the elevation.
    /// - Parameter elevation: Elevations enum to choose the level of drop shadow.
    func setShadowElevation(elevation: PolarisDesignTokenElevationType) -> some View {
        var settings = PolarisDesignTokenElevation.elevation0
        switch elevation {
        case .elevation0:
            settings = PolarisDesignTokenElevation.elevation0
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        case .elevation1:
            settings = PolarisDesignTokenElevation.elevation1
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        case .elevation2:
            settings = PolarisDesignTokenElevation.elevation2
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        case .elevation3:
            settings = PolarisDesignTokenElevation.elevation3
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        case .elevation4:
            settings = PolarisDesignTokenElevation.elevation4
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        case .elevation5:
            settings = PolarisDesignTokenElevation.elevation5
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        case .elevation6:
            settings = PolarisDesignTokenElevation.elevation6
            return self.shadow(color: settings.color.opacity(Double(settings.alpha)), radius: settings.blur, x: settings.x, y: settings.y)
        }
    }
}

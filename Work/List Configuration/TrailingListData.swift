//
//  TrailingListData.swift
//  PhoenixUIKit
//
//  Created by Bharat Kumar on 12/4/23.
//  Copyright © 2023 Dexcom, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum TrailingListData {
    
    case detailBadge(content: String, count: Int, badgeColor: Color? = nil)
    
    case detailIcon(content: String, trailingIconName: String)
    
    case detailSmallIcon(content: String, trailingIconName: String)
    
    case detailWithChevron(content: String)
    /// Creates a trailing details with toggle
    /// `content` parameter. This represent the text of the view
    ///  `isOne` parameter. This is binding for the toggle
    case detailToggle(content: String, isOn: Binding<Bool>)
    
    /// Create a trailing badge with icon
    ///  `count` parameter. This is number of count that appers on the badge
    ///  `trailingIconName` parameter. This is use to set the view icon/image
    ///  `trailingIconTint` parameter. This is use to set the tint color of the icon/image
    case badgeIcon(count: Int, badgeColor: Color?, trailingIconName: String, trailingIconTint: Color?)
    
    /// Create a trailing icon
    ///  `trailingIconName` parameter. This is use to set the view icon/image
    ///  `trailingIconTint` parameter. This is use to set the tint color of the icon/image
    case icon(trailingIconName: String, trailingIconTint: Color?)
    
    /// Create trailing number unit
    /// `number` parameter. This is use to set to number of the unit
    case numberUnit(number: Double)
    
    /// Create traling number unit with badge
    /// `number` parameter. This is use to set to number of the unit
    ///  `trailingIconName` parameter. This is use to set the view icon/image
    ///  `trailingIconTint` parameter. This is use to set the tint color of the icon/image
    case numberUnitIcon(number: Double, trailingIconName: String, trailingIconTint: Color?)
    
    public var body: AnyView {
        switch self {
        case .detailBadge(let content, let count, let badgeColor):
            return HStack {
                Text(content)
                    .textStyle(.body2.regular.textSecondary)
                ZStack {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(badgeColor ?? .red)
                    Text(String(count))
                        .foregroundColor(.white)
                }
                .padding(.leading, 8)
                .padding(.trailing, 12)
            }
            .anyView()
            
        case .detailIcon(let content, let trailingIconName):
            return HStack {
                Text(content)
                    .textStyle(.body2.regular.textSecondary)
                    .padding(.leading, 8)
                Image(trailingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.polarisColors.iconSecondary)
                    .padding(.trailing, 12)
            }
            .anyView()
            
        case .detailSmallIcon(let content, let trailingIconName):
            return HStack {
                Text(content)
                    .textStyle(.body2.regular.textSecondary)
                    .padding(.leading, 8)
                Image(trailingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.polarisColors.iconSecondary)
                    .padding(.trailing, 12)
            }
            .anyView()
            
        case .detailWithChevron(let content):
            return HStack {
                Text(content)
                    .textStyle(.body2.regular.textSecondary)
                Image(DexIcons.icons.controls.icoChevronFw, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.polarisColors.iconSecondary)
                    .padding(.trailing, 12)
            }
            .anyView()
            
        case .detailToggle(let content, let isOn):
            return Toggle(isOn: isOn) {
                Text(content)
                    .textStyle(.body2.regular.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 12)
            }
            .padding(.trailing, 16)
            .anyView()
            
        case .badgeIcon(let count, let badgeColor, let trailingIconName, let trailingIconTint):
            return  HStack {
                ZStack {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(badgeColor ?? .red)
                    Text(String(count))
                        .foregroundColor(.white)
                }
                Image(trailingIconName)
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 32, height: 32)
                    .foregroundColor(trailingIconTint)
                    .padding(.trailing, 12)
            }
            .anyView()
            // This can be using for chevron forward, upward and downward as well
        case .icon(let trailingIconName, let trailingIconTint):
            return HStack {
                Image(trailingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(trailingIconTint)
                    .padding(.trailing, 12)
            }
            .anyView()
            
        case .numberUnit(let number):
            return HStack(spacing:3) {
                Text(String(number))
                    .textStyle(.body2.semibold.textPrimary)
                Text("u")
                    .textStyle(.body2.regular.textSecondary)
                    .padding(.trailing, 12)
            }
            .anyView()
            
        case .numberUnitIcon(let number, let trailingIconName, let trailingIconTint):
            return HStack(spacing:5) {
                HStack(spacing:3) {
                Text(String(number))
                    .textStyle(.body2.semibold.textPrimary)
                
                Text("u")
                    .textStyle(.body2.regular.textSecondary)
               }
                Image(trailingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(trailingIconTint)
                    .padding(.trailing, 12)
            }
            .anyView()
        }
    }
}

struct TrailingListDataDemo: View {
    let trailingListData: TrailingListData
    var body: some View {
        trailingListData.body
    }
}

public struct TrailingListDataDemo_Previews: PreviewProvider {
    public static var previews: some View {
        TrailingListDataDemo(trailingListData: .numberUnitIcon(number: 8.0, trailingIconName: "ico_chevron_fw", trailingIconTint: .backgroundPrimary))
    }
}

extension View {
    func anyView() -> AnyView {
        return AnyView(self)
    }
}

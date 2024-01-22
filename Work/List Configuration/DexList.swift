//
//  DexList.swift
//  PhoenixUIKit
//
//  Created by Bharat Kumar on 12/17/23.
//  Copyright © 2023 Dexcom, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum DexListType: Equatable {
    case dexListItem(dexItemType: DexItemType)
    case dexSection(dexSectionType: DexSectionType)
}

public struct DexList: View {
    public var leadingListData: LeadingListData?
    public var trailingListData: TrailingListData?
    public let type: DexListType
    public var disabled = false
    public let items: [DexSectionItem]?
    public let padding: EdgeInsets
    public var onClick: (() -> Void)?
    
    public init(dexSectionType: DexSectionType = .primary, padding: EdgeInsets = EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20), items: [DexSectionItem]) {
        self.type = .dexSection(dexSectionType: dexSectionType)
        self.padding = padding
        self.items = items
    }
    
    public init(leadingListData: LeadingListData,
                trailingListData: TrailingListData? = nil,
                dexItemType: DexItemType = .primary, padding: EdgeInsets = EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20),
                disabled: Bool = false, onClick: @escaping () -> Void) {
        
        self.leadingListData = leadingListData
        self.trailingListData = trailingListData
        self.type = .dexListItem(dexItemType: dexItemType)
        self.disabled = disabled
        self.padding = padding
        self.items = nil
        self.onClick = onClick
    }
    
    public var body: some View {
        switch type {
        case let .dexListItem(dexItemType):
            DexListItem(
                leadingListData: leadingListData!,
                trailingListData: trailingListData,
                disabled: disabled,
                itemType: dexItemType
            ) {
                onClick!()
            }
            .padding(padding)
        case let .dexSection(dexSectionType):
            DexSection(
                items: items!,
                sectionType: dexSectionType, padding: padding
            )
        }
    }
}

public struct DexList_Previews: PreviewProvider {
    public static var previews: some View {
        DexList(leadingListData: .link(link: "Title"),  trailingListData: .badgeIcon(count: 10, badgeColor: .red, trailingIconName: "chevron.forward", trailingIconTint: nil)) {
        }
    }
}

public enum DexItemType {
    case primary
    case secondary
}

private struct DexListItem: View {
    public let leadingListData: LeadingListData
    public let trailingListData: TrailingListData?
    public let disabled: Bool
    public let itemType: DexItemType
    public let onClick: () -> Void
    
    public init(leadingListData: LeadingListData, trailingListData: TrailingListData?,
                disabled: Bool = false, itemType: DexItemType = DexItemType.primary, onClick: @escaping () -> Void) {
        self.leadingListData = leadingListData
        self.trailingListData = trailingListData
        self.disabled = disabled
        self.itemType = itemType
        self.onClick = onClick
    }
    
    public var body: some View {
        
        if itemType == DexItemType.primary {
            Section {
                if(disabled) {
                    DisabledDexListItem(leadingListData: leadingListData, trailingListData: trailingListData) {
                        onClick()
                    }
                } else {
                    ActiveDexListItem(leadingListData: leadingListData, trailingListData: trailingListData) {
                        onClick()
                    }
                }
            }
            .cornerRadius(12)
            .setShadowElevation(elevation: .elevation2)
        } else {
            Section {
                if disabled {
                    DisabledDexListItem(leadingListData: leadingListData, trailingListData: trailingListData) {
                        onClick()
                    }
                } else {
                    ActiveDexListItem(leadingListData: leadingListData, trailingListData: trailingListData) {
                        onClick()
                    }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(Color.polarisColors.backgroundSecondary, lineWidth: 1)
            )
        }
    }
}

private struct DisabledDexListItem: View {
    public let leadingListData: LeadingListData
    public let trailingListData: TrailingListData?
    let onClick: () -> Void
    
    public var body: some View {
        VStack {
            Button {
                onClick()
            } label: {
                HStack {
                    leadingListData.body
                    if trailingListData != nil {
                        trailingListData?.body
                    }
                }
                .foregroundColor(Color.polarisColors.backgroundPrimary)
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            .disabled(true)
            .foregroundColor(Color.polarisColors.backgroundPrimary)
        }
    }
}

private struct ActiveDexListItem: View {
    let leadingListData: LeadingListData
    let trailingListData: TrailingListData?
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            HStack {
                leadingListData.body
                if trailingListData != nil {
                    trailingListData?.body
                }
            }
            .frame(maxHeight: 72)
        }
        .buttonStyle(PressedButtonStyle())
    }
}

private struct PressedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            .background(configuration.isPressed ? Color.polarisColors.backgroundPrimary : Color.white)
    }
}

public enum DexSectionType {
    case primary
    case secondary
}

private struct DexSection: View {
    let items: [DexSectionItem]
    let sectionType: DexSectionType
    let padding: EdgeInsets
    init(items: [DexSectionItem], sectionType: DexSectionType = DexSectionType.primary, padding: EdgeInsets) {
        self.items = items
        self.sectionType = sectionType
        self.padding = padding
    }
    
    var body: some View {
        if(sectionType == DexSectionType.primary) {
            VStack {
                ForEach(0..<items.count, id: \.self) { index in
                    items[index]
                    if(index != items.count - 1) {
                        Divider()
                            .padding(.leading, 20)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .setShadowElevation(elevation: .elevation2)
            .padding(padding)
        } else {
            VStack {
                ForEach(0..<items.count, id: \.self) { index in
                    items[index]
                    Divider()
                        .padding(.leading, 20)
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(Color.polarisColors.borderPrimary, lineWidth: 1)
            )
            .padding(padding)
        }
    }
}

public struct DexSectionItem: View {
    let leadingListData: LeadingListData
    let trailingListData: TrailingListData?
    let disabled: Bool
    let onClick: (() -> Void)?
    
    public init(leadingListData: LeadingListData, trailingListData: TrailingListData?, disabled: Bool = false, onClick: @escaping () -> Void = {}) {
        self.leadingListData = leadingListData
        self.trailingListData = trailingListData
        self.disabled = disabled
        self.onClick = onClick
    }
    
    public var body: some View {
        Button(action: {
            onClick!()
        }, label: {
            HStack {
                leadingListData.body
                if(trailingListData != nil) {
                    trailingListData!.body
                }
            }
        })
        .buttonStyle(DexSectionButtonStyle())
    }
}

private struct DexSectionButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            .background(configuration.isPressed ? Color.polarisColors.backgroundPrimary : Color.white)
    }
}

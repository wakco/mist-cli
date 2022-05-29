//
//  String+Extension.swift
//  Mist
//
//  Created by Nindi Gill on 10/3/21.
//

import Foundation

extension String {

    enum Color: String, CaseIterable {
        case black = "\u{001B}[0;30m"
        case red = "\u{001B}[0;31m"
        case green = "\u{001B}[0;32m"
        case yellow = "\u{001B}[0;33m"
        case blue = "\u{001B}[0;34m"
        case magenta = "\u{001B}[0;35m"
        case cyan = "\u{001B}[0;36m"
        case white = "\u{001B}[0;37m"
        case brightBlack = "\u{001B}[0;90m"
        case brightRed = "\u{001B}[0;91m"
        case brightGreen = "\u{001B}[0;92m"
        case brightYellow = "\u{001B}[0;93m"
        case brightBlue = "\u{001B}[0;94m"
        case brightMagenta = "\u{001B}[0;95m"
        case brightCyan = "\u{001B}[0;96m"
        case brightWhite = "\u{001B}[0;97m"
        case reset = "\u{001B}[0;0m"
    }

    static let appName: String = "mist"
    static var identifier: String { "com.ninxsoft.\(appName)" }
    static let abstract: String = "macOS Installer Super Tool."
    static let discussion: String = "Automatically download macOS Installers / Firmwares."
    static let temporaryDirectory: String = "/private/tmp/com.ninxsoft.mist"
    static let outputDirectory: String = "/Users/Shared/Mist"
    static let filenameTemplate: String = "Install %NAME% %VERSION%-%BUILD%"
    static let repositoryURL: String = "https://github.com/ninxsoft/\(appName)"
    static let latestReleaseURL: String = "https://api.github.com/repos/ninxsoft/\(appName)/releases/latest"

    func wrappedInPropertyList() -> String {
        "<?xml version=\"1.0\"?>" +
        "<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" +
        "<plist version=\"1.0\">" +
        self +
        "</plist>"
    }

    func color(_ color: Color) -> String {
        color.rawValue + self + Color.reset.rawValue
    }

    func stringWithSubstitutions(using firmware: Firmware) -> String {
        self.replacingOccurrences(of: "%NAME%", with: firmware.name)
            .replacingOccurrences(of: "%VERSION%", with: firmware.version)
            .replacingOccurrences(of: "%BUILD%", with: firmware.build)
            .replacingOccurrences(of: "//", with: "/")
    }

    func stringWithSubstitutions(using product: Product) -> String {
        self.replacingOccurrences(of: "%NAME%", with: product.name)
            .replacingOccurrences(of: "%VERSION%", with: product.version)
            .replacingOccurrences(of: "%BUILD%", with: product.build)
            .replacingOccurrences(of: "//", with: "/")
    }
}

//
//  ResultBundle.swift
//  XCParser
//
//  Created by Soaurabh Kakkar on 13/08/20.
//

import Foundation

class ResultBundle {
    let projectPath: String
    
    init(xcodeprojPath: String) {
        projectPath = xcodeprojPath
    }
    
    lazy private(set) var projRelativePath: String? = {
        let resultBundlesDir = URL(fileURLWithPath: projectPath).deletingLastPathComponent().appendingPathComponent("ResultBundles")
        guard let _ = try? FileManager.default.createDirectory(at: resultBundlesDir, withIntermediateDirectories: true, attributes: nil) else {
            return nil
        }
        let resultBundlePath = resultBundlesDir.appendingPathComponent("ResultBundle_\(Int(Date().timeIntervalSinceReferenceDate)).xcresult").path
        return resultBundlePath
    }()
}

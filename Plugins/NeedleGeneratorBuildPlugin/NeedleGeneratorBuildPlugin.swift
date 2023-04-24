//
//  NeedleGeneratorBuildPlugin.swift
//  
//
//  Created by Lucas Antevere Santana on 14/01/23.
//

import Foundation
import PackagePlugin

@main
struct NeedleGeneratorBuildPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            .prebuildCommand(
                displayName: "Needle Generator BuildTool Plugin",
                executable: try context.tool(named: "needle").path,
                arguments: [
                    "generate"
                ],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension NeedleGeneratorBuildPlugin: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        return [
            .prebuildCommand(
                displayName: "Needle Generator BuildTool Plugin",
                executable: try context.tool(named: "needle").path,
                arguments: [
                    "generate"
                ],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}
#endif

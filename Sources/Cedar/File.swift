
import ArgumentParser
import Foundation
import SwiftUI

struct File: ExpressibleByArgument {

    private let url: URL
    let name: String

    init?(argument: String) {
        guard let directory = Process().currentDirectoryURL else { return nil }
        url = URL(fileURLWithPath: argument, relativeTo: directory)
        name = url.lastPathComponent
        print(url)
        print(name)
    }
}

extension File {

    var binding: Binding<String> {
        Binding(get: content, set: setContent)
    }

    private func content() -> String {
        guard let data = try? Data(contentsOf: url) else { return "" }
        guard let string = String(data: data, encoding: .utf8) else { return "" }
        return string
    }

    private func setContent(_ content: String) {
        guard let data = content.data(using: .utf8) else { return }
        try? data.write(to: url)
    }
}

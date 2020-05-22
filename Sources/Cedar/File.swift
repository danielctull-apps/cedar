
import ArgumentParser
import Foundation
import SwiftUI

struct File: ExpressibleByArgument {

    fileprivate let url: URL
    let name: String
    init?(argument: String) {
        guard let directory = Process().currentDirectoryURL else { return nil }
        url = URL(fileURLWithPath: argument, relativeTo: directory)
        name = url.lastPathComponent
        print(url)
        print(name)
    }
}

extension FileManager {

    func binding(for file: File) -> Binding<String> {
        Binding(get: contents(of: file),
                set: setContents(of: file))
    }

    private func contents(of file: File) -> () -> String {
        {
            guard let data = try? Data(contentsOf: file.url) else { return "" }
            guard let string = String(data: data, encoding: .utf8) else { return "" }
            return string
        }
    }

    private func setContents(of file: File) -> (String) -> () {
        { contents in
            guard let data = contents.data(using: .utf8) else { return }
            try? data.write(to: file.url)
        }
    }
}

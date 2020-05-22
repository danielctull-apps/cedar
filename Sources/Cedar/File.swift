
import ArgumentParser

struct File: ExpressibleByArgument {

    private let rawValue: String
    init?(argument: String) {
        self.rawValue = argument
    }
}

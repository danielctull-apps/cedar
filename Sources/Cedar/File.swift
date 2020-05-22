
import ArgumentParser

struct File: ExpressibleByArgument {

    let name: String
    init?(argument: String) {
        self.name = argument
    }
}

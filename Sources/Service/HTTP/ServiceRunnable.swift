import Kitura 

public protocol ServiceRunnable {

    /// Mode at which the server is running. Useful for 
    /// development purposes as the server can be used as
    /// an instant feedback agent whilst designing and developing
    /// aspects of an application.
    var mode: RunMode { get set }

    func addRouter(_ router: Router)

    func run(withPort port: Int) throws

}

/// Available modes for services to operate under. 
public enum RunMode: String {

    /// Test executes the process without attaching to STDIN
    /// to allow for tests to execute before the process exits
    /// normally.
    case test = "test"

    /// Production is the most lightweight and performant mode, with
    /// minimal verbosity.
    case production = "production"
    
    /// Development provides debugging options, verbose logging, 
    /// and the ability to hot-switch between themes.
    case development = "development"
    
    init(value: String) {
        switch value {
        case "test": self = .test
        case "development": self = .development
        case "production": self = .production
        default: self = .development
        }
    }
}

public enum ServiceRunnerError: Error {
    case noAvailableRouter
}
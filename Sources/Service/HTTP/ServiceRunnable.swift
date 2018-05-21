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

public enum ServiceRunnerError: Error {
    case noAvailableRouter
}
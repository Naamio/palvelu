import Kitura 

/// # ServiceRunnable
///
/// Represents an executable service runtime. This should be
/// a high-level wrapper around a standard HTTP process, with
/// routable capabilities.
public protocol ServiceRunnable {

    /// Adds a router to the runnable service. For implementations
    /// that support multiple routers, this will allow grouping
    /// routers together for a single HTTP process, or for 
    /// automatic grouping to individually assigned HTTP processes.
    /// - Parameters:
    ///   - router: Router for handling URI paths.
    func addRouter(_ router: Router)

    /// Runs the runnable service process as a blocking call.
    /// This means no response is expected.
    ///
    /// - Parameters:
    ///   - withPort: Port number to use for the runnable process.
    ///
    /// - Throws: Throws a `noAvailableRouter` exception if 
    ///           no router has been assigned. At least one
    ///           router is required.
    func run(withPort port: Int) throws

}

/// Errors thrown by the `ServiceRunnable` process.
public enum ServiceRunnerError: Error {
    /// Thrown if no router is available for the service process.
    case noAvailableRouter
}
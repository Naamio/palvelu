import Kitura

/// # ServiceRunner
///
/// Basic runnable service wrapper abstracting the HTTP process
/// and underlying HTTP API with a service-oriented API focused 
/// on web applications and REST services.
///
/// In order to use a single `ServiceRunner`, simply intantiate
/// as follows:
///
/// ```swift 
/// let runner = ServiceRunner(withPort: 8090)
/// runner.addRouter(router)
///
/// let dispatch = ServiceDispatch()
///
/// dispatch.addRunner(runner)
///
/// do {
///     try dispatch.run()
/// } catch {
///     println("Cannot dispatch runner on port 8090")
/// }
/// ```
open class ServiceRunner {

    public let port: Int

    /// Router assigned to the HTTP process.
    public var router: Router?

    /// Initializes a new `ServiceRunner` with base setup.
    public required init(withPort port: Int) {
        self.port = port
    }

    /// Test the service by executing the HTTP process as a non-blocking
    /// and non-waiting process. Once the tests are finished, the HTTP
    /// process will end.
    public func test(withPort port: Int) throws {
        guard let router = router else {
            throw ServiceRunnerError.noAvailableRouter
        }

        Kitura.addHTTPServer(onPort: port, with: router)
        Kitura.start()
    }
}
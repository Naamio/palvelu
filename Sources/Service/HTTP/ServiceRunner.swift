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
/// ```
///     let runner = ServiceRunner() 
///
///     // Add HTTP Server to listen on port 8090
///     let port = 8090
///
///     // Router is up to you to create.
///     runner.addRouter(router)
///
///     do {
///         try runner.run(withPort: port)
///     } catch {
///         println("Cannot start runner on port \(port)")
///     }
/// ```
open class ServiceRunner {

    /// Router assigned to the HTTP process.
    private var router: Router?

    /// Initializes a new `ServiceRunner` with base setup.
    public init() {

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

/// MARK: - ServiceRunnable Implementation

extension ServiceRunner: ServiceRunnable {
    open func addRouter(_ router: Router) {
        self.router = router
    }

    open func run(withPort port: Int) throws {
        guard let router = router else {
            throw ServiceRunnerError.noAvailableRouter
        }

        Kitura.addHTTPServer(onPort: port, with: router)
        // start the framework - the servers added until now will start listening
        Kitura.run()
    }

    open func stop() {
        Kitura.stop()
    }
}
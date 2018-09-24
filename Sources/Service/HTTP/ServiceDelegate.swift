
/// General interface for managing service dispatches.
public protocol ServiceDelegate {

    /// Adds a `ServiceRunnable` based runner onto the dispatch queue, ready for execution.
    /// The _runner_ must have a port set, although it is not a strict requirement that 
    /// the port is exclusive to the single _runner_. 
    ///
    /// No routes are necessary on the _runner_.
    ///
    ///  - Parameters:
    ///    - runner: The runner to attach to the dispatch queue for execution.
    func addRunner(_ runner: ServiceRunnable)

    /// Executes all runners (`ServiceRunnable`) on the dispatch queue. 
    func run() throws
}
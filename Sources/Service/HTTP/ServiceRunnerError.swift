/// Errors thrown by the `ServiceRunnable` process.
public enum ServiceRunnerError: Error {
    /// Thrown if no router is available for the service process.
    case noAvailableRouter
}
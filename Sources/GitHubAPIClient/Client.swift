import Dependencies
import DependenciesMacros
import Entity

@DependencyClient
public struct GitHubAPIClient {
  public var searchRepositories: @Sendable (_ query: String) async throws -> [Repository]
}

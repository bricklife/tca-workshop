import Dependencies
import DependenciesMacros
import Entity

@DependencyClient
public struct GitHubAPIClient: Sendable {
  public var searchRepositories: @Sendable (_ query: String) async throws -> [Repository]
}

import 'package:graphql/client.dart';
import 'package:normalize/utils.dart';
import 'package:gql/ast.dart';
import 'package:gql/document.dart';
import 'package:gql/language.dart';
import 'package:gql/operation.dart';
import 'package:gql/schema.dart';


class AddNestedTypenameVisitor extends AddTypenameVisitor {
  @override
  visitOperationDefinitionNode(node) => node;
}

DocumentNode gql2(String document) => transform(
  parseString(document),
  [AddNestedTypenameVisitor()],
);


Future<GraphQLClient> getClient() async {
  final _httpLink = HttpLink(
    'https://api.studio.thegraph.com/query/3034/everything/v0.0.5',
  );

  /// initialize Hive and wrap the default box in a HiveStore
  final store = await HiveStore.open(path: 'my/cache/path');
  return GraphQLClient(
    /// pass the store to the cache for persistence
    cache: GraphQLCache(store: store),
    link: _httpLink,
  );
}

class InfoGetter2 {
  Future<List> get2() async {
    final client = await getClient();

    const String readRepositories = r'''
  {
    users(first: 5) {
      id
      name
      timeRegistration
      surname
    }
  }
  ''';
    const int nRepositories = 5;

    final QueryOptions options = QueryOptions(
        documentNode: gql2(readRepositories),
        variables: <String, dynamic>{
          'nRepositories': nRepositories
        });
  // ...

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      print(result);
    }

    final List<dynamic> repositories =
    result.data!['users'] as List<dynamic>;
    print(repositories);
    return repositories;
  // ...
  }
}
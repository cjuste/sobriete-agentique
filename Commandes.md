mvn clean package
rtk mvn clean package
git log
rtk git log

Claude seul, avec /brief et avec /caveman

codebase-memory-mcp daemon start

codebase-memory-mcp cli delete_project --project Users-cjuste-IdeaProjects-kovoit_rest_api
codebase-memory-mcp cli index_repository --repo-path /Users/cjuste/IdeaProjects/kovoit_rest_api
codebase-memory-mcp cli get_architecture --project Users-cjuste-IdeaProjects-kovoit_rest_api
codebase-memory-mcp cli search_graph --project Users-cjuste-IdeaProjects-kovoit_rest_api --name-pattern ".*findByCompanyId.*"
codebase-memory-mcp cli trace_path \
--project Users-cjuste-IdeaProjects-kovoit_rest_api \
--function-name "Users-cjuste-IdeaProjects-kovoit_rest_api.src.main.java.com.kovoit.restapi.service.TravelerService.findByCompanyId" \
--direction inbound \
--depth 3 \
--include-tests false

codebase-memory-mcp --ui=true --port=9749

/canary
cp /Users/cjuste/.claude/settings.json.with_status_bar /Users/cjuste/.claude/settings.json
/model Opus/Fable
/planning-technical-solutions Sépare les Traveler en 2 types, Driver et Passenger. Ne te préoccupe pas de la migration des données, le système n'est pas encore en production où que ce soit.

/kaizen
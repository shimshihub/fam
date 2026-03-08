#!/bin/bash
# Auto-organize files written to domain folder roots into their docs/ subfolders
# Triggers on Write tool — moves files from parenting/, home/, finances/, health/ roots into docs/

# Read hook input from stdin
hook_input=$(cat)

# Extract file path from hook input
file_path=$(echo "$hook_input" | jq -r '.tool_input.file_path // empty')

# Skip CLAUDE.md files — they belong in the root
basename=$(basename "$file_path")
if [[ "$basename" == "CLAUDE.md" ]]; then
  exit 0
fi

# Check if file is in a domain folder root (not already in docs/)
for domain in parenting home finances health; do
  domain_path="/Users/orishimon/Documents/Claude Code Files/Fam/${domain}"

  # Match files directly in the domain root (not in docs/ or other subfolders)
  if [[ "$file_path" == "${domain_path}/"* ]] && [[ ! "$file_path" == "${domain_path}/docs/"* ]]; then
    # Only move if it's a direct child (no additional path segments beyond filename)
    relative="${file_path#${domain_path}/}"
    if [[ "$relative" != *"/"* ]]; then
      # File is in domain root — move to docs/
      mkdir -p "${domain_path}/docs"
      mv "$file_path" "${domain_path}/docs/${basename}"
      echo "Moved ${basename} → ${domain}/docs/"
      exit 0
    fi
  fi
done

exit 0

# Personal Development Standards

## Git Workflow

### Branch Naming

- Always prefix branch names with `Okabe-Junya/`
- Format: `Okabe-Junya/{type}/{description}`
- Types: `feature`, `fix`, `docs`, `refactor`, `test`, `chore`
- Use lowercase and hyphens
- Examples:
  - `Okabe-Junya/feature/add-user-auth`
  - `Okabe-Junya/fix/timeout-issue`
  - `Okabe-Junya/docs/update-readme`

### Commit Messages

- Use semantic commit messages (Conventional Commits)
- Keep it concise in a single line
- Do NOT add co-author or attribution lines
- Format: `{type}({scope}): {description}`
- Types:
  - `feat`: New feature
  - `fix`: Bug fix
  - `docs`: Documentation
  - `refactor`: Code refactoring
  - `test`: Adding or updating tests
  - `chore`: Build, CI, dependencies
  - `perf`: Performance improvement
  - `style`: Code style (formatting, etc.)
- Examples:
  - `feat(auth): add two-factor authentication`
  - `fix(api): resolve race condition in cache`
  - `docs(readme): update installation steps`
  - `chore(deps): bump go version to 1.22`
